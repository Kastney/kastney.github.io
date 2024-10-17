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
    
      # Cria a nova página
      create_new_page(site, page, path, posts_for_page, current_page, total_pages)
    
      Jekyll.logger.warn "Paginate", "[#{current_page}] >> [#{total_pages}] >> [#{posts_for_page}]"
      Jekyll.logger.info "", ""
      
      page.data["pagineted"] = true
    end

    def create_new_page(site, page, path, posts_for_page, current_page, total_pages)
      # Cria o conteúdo da nova página
      content = <<-YAML
      #{page.data.to_yaml.strip}
      YAML
    
      # Escreve o conteúdo no arquivo
      FileUtils.mkdir_p(File.dirname(path)) unless File.exist?(File.dirname(path))
      File.write(path, content)
    end
  end
end