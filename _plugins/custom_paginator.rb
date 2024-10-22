require 'fileutils'

module Jekyll
  class CustomPaginatorGenerator < Generator
    safe true

    def generate(site)
      Jekyll::Hooks.register :site, :post_write do |_site|
        site.pages.each do |page|
          if page.data["per_page"] && page.data["collection"] && !(page.data["pagineted"] ||= false)
            paginate(site, page)
            page.data["pagineted"] = true
          end
        end
      end
    end

    private

    def paginate(site, page)
      collection_name = "#{page.data["collection"]}_#{site.config["lang"]}"
      all_posts = site.collections[collection_name].docs.sort_by { |doc| doc.data["date"] }.reverse

      per_page = page.data["per_page"]
      total_pages = (all_posts.size.to_f / per_page).ceil

      (1..total_pages).each do |current_page|
        create(site, page, all_posts, current_page, per_page, total_pages)
      end
    end

    def create(site, page, all_posts, current_page, per_page, total_pages)
      Jekyll.logger.info "", ""

      # Define os posts para essa página
      start_index = (current_page - 1) * per_page
      posts_for_page = all_posts.slice(start_index, per_page) || []
    
      # Define o caminho da nova página
      if current_page == 1
        path = File.join(site.dest, page.url, 'index.html')
      else
        path = File.join(site.dest, page.url, "#{current_page}/index.html")
      end
    
      # Gera o conteúdo da nova página
      content = content_render(site, page)

      rendered_content = apply_layouts(site, content, page)
      # Cria a nova página
      # Jekyll.logger.warn "Paginate", "[#{current_page}] >> [#{total_pages}] >> [#{posts_for_page}]"
      
      # Cria um novo arquivo com o conteúdo passado pelo parâmetro
      create_new_page(path, rendered_content)

      Jekyll.logger.info "", ""
    end

    def apply_layouts(site, content, page)
      layout_name = page.data["layout"]
      layout = site.layouts[layout_name]

      return content unless layout  # Se não houver layout, retorna o conteúdo renderizado.

      # Monta o payload para renderização
      payload = site.site_payload.merge(
        "content" => content,
        "page" => page.to_liquid
      )

      info = { "site" => site.config, "page" => page.data }

      # Renderiza o layout atual com o conteúdo embutido
      rendered_layout = site.liquid_renderer.file(layout.path)
                                  .parse(layout.content)
                                  .render!(payload, info)

      # Se o layout atual tiver outro layout pai, renderiza recursivamente
      if layout.data["layout"]
        page.data["layout"] = layout.data["layout"]
        apply_layouts(site, rendered_layout, page)
      else
        rendered_layout
      end
    end

    def content_render(site, page)
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      rendered_content = converter.convert(page.content)
      
      Jekyll.logger.warn "Renderizado", "#{page.content}"
      
      layout_name = page.data["layout"]
      layout = site.layouts[layout_name]
      
      if layout
        # Monta o payload necessário para renderização do layout
        payload = site.site_payload.merge(
          "content" => rendered_content,
          "page" => page.to_liquid
        )

        # Renderiza o layout com o conteúdo embutido
        info = { "site" => site.config, "page" => page.data }
        layout_content = layout.content

        # Substitui {{ content }} pelo conteúdo da página
        new_content = site.liquid_renderer.file(layout.path).parse(layout_content).render!(payload, info)
      else
        rendered_content
      end
    end

    def create_new_page(path, content)
      FileUtils.mkdir_p(File.dirname(path)) unless File.exist?(File.dirname(path))
      File.write(path, content)
      Jekyll.logger.warn "Page created at", "#{path}"
      Jekyll.logger.warn "", "#{content}"
    end
  end
end