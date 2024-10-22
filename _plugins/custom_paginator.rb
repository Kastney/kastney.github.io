require 'fileutils'

module Jekyll
  class CustomPaginatorGenerator < Generator
    safe true

    def generate(site)
      Jekyll::Hooks.register :site, :post_write do |_site|
        site.pages.each do |page|
          if page.data["per_page"] && !(page.data["pagineted"] ||= false)
            paginate(site, page)
          end
        end
      end
    end

    private

    def paginate(site, page)
      collection_name = "certificates_#{site.config["lang"]}"
      all_posts = site.collections[collection_name].docs.sort_by { |doc| doc.data["date"] }.reverse

      per_page = page.data["per_page"]
      total_pages = (all_posts.size.to_f / per_page).ceil

      (1..total_pages).each do |current_page|
        create(site, page, all_posts, current_page, per_page, total_pages)
      end
    end

    def create(site, page, all_posts, current_page, per_page, total_pages)
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

      # Cria a nova página
      # Jekyll.logger.warn "Paginate", "[#{current_page}] >> [#{total_pages}] >> [#{posts_for_page}]"
      Jekyll.logger.warn "Page", "#{content}"
      Jekyll.logger.info "", ""
      
      # Cria um novo arquivo com o conteúdo passado pelo parâmetro
      # create_new_page(path, content)

      # Atribuição da flag para informar que a página foi criada com sucesso
      page.data["pagineted"] = true
    end

    def content_render(site, page)
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      rendered_content = converter.convert(page.content)

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
    end
  end
end