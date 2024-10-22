require 'fileutils'

module Jekyll
  class CustomPaginatorGenerator < Generator
    safe true

    def generate(site)
      Jekyll::Hooks.register :site, :post_write do |_site|
        site.pages.each do |page|
          if page.data["per_page"] && page.data["collection"] && !(page.data["paginated"] ||= false)
            paginate(site, page)
            page.data["paginated"] = true
          end
        end
      end
    end

    private

    def paginate(site, page)
      collection_name = "#{page.data["collection"]}_#{site.config["lang"]}"
      all_posts = site.collections[collection_name]
                      .docs.sort_by { |doc| doc.data["date"] }.reverse

      per_page = page.data["per_page"]
      total_pages = (all_posts.size.to_f / per_page).ceil

      (1..total_pages).each do |current_page|
        create_page(site, page, all_posts, current_page, per_page, total_pages)
      end
    end

    def create_page(site, page, all_posts, current_page, per_page, total_pages)
      start_index = (current_page - 1) * per_page
      posts_for_page = all_posts.slice(start_index, per_page) || []

      # Define o caminho da nova página
      path = current_page == 1 ? 
             File.join(site.dest, page.url, 'index.html') : 
             File.join(site.dest, page.url, "#{current_page}/index.html")

      # Renderiza o conteúdo e aplica layouts
      content = render_content(site, page)
      final_content = apply_layouts(site, content, page)

      # Cria o arquivo com o conteúdo final
      write_page(path, final_content)
    end

    def render_content(site, page)
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      converter.convert(page.content)
    end

    def apply_layouts(site, content, page, current_layout = nil)
      # Recupera o nome do layout atual (do argumento ou da página)
      layout_name = current_layout || page.data["layout"]
      layout = site.layouts[layout_name]
    
      return content unless layout  # Se não houver layout, retorna o conteúdo simples.
    
      # Cria o payload para renderização
      payload = site.site_payload.merge(
        "content" => content,
        "page" => page.to_liquid
      )
    
      info = { "site" => site.config, "page" => page.data }
    
      # Renderiza o layout atual com o conteúdo embutido
      rendered = site.liquid_renderer.file(layout.path)
                                     .parse(layout.content)
                                     .render!(payload, info)
    
      # Se o layout atual tiver outro layout pai, faz a recursão preservando o estado
      if layout.data["layout"]
        apply_layouts(site, rendered, page, layout.data["layout"])
      else
        rendered
      end
    end

    def write_page(path, content)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, content)

      Jekyll.logger.info "", ""
      Jekyll.logger.warn "Page created:", content
    end
  end
end