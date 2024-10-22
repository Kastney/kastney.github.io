require 'fileutils'

module Jekyll
  # CustomPaginatorGenerator é uma classe que estende o gerador Jekyll para adicionar funcionalidade de paginação.
  # Ele cria páginas paginadas para coleções de conteúdo com base nas configurações definidas nas páginas.
  class CustomPaginatorGenerator < Generator
    safe true  # Indica que este gerador não modifica o site durante a geração.

    # Método principal que é chamado para gerar páginas paginadas.
    # Registra um hook que será acionado após a escrita do site.
    def generate(site)
      Jekyll::Hooks.register :site, :post_write do |_site|
        site.pages.each do |page|
          # Verifica se a página possui configurações para paginação.
          if page.data["per_page"] && page.data["collection"] && !(page.data["paginated"] ||= false)
            paginate(site, page)  # Chama o método para paginar a página.
            page.data["paginated"] = true  # Marca a página como já paginada.
          end
        end
      end
    end

    private

    # Método responsável pela lógica de paginação.
    def paginate(site, page)
      # Cria o nome da coleção baseado no idioma.
      collection_name = "#{page.data["collection"]}_#{site.config["lang"]}"
      # Valida se a coleção existe no site
      unless site.collections.key?(collection_name)
        return  # Retorna se a coleção não existir, evitando erros.
      end

      # Ordena os documentos pela data em ordem decrescente.
      all_posts = site.collections[collection_name].docs.sort_by { |doc| doc.data["date"] }.reverse
      # Obtém o número de postagens por página.
      per_page = page.data["per_page"]
      # Calcula o total de páginas necessárias.
      total_pages = (all_posts.size.to_f / per_page).ceil

      # Cria páginas para cada página atual calculada.
      (1..total_pages).each do |current_page|
        create_page(site, page, all_posts, current_page, per_page, total_pages)
      end
    end

    # Método responsável por criar uma página paginada específica.
    def create_page(site, page, all_posts, current_page, per_page, total_pages)
      # Calcula o índice inicial para os posts da página atual.
      start_index = (current_page - 1) * per_page
      # Obtém os posts para a página atual.
      posts_for_page = all_posts.slice(start_index, per_page) || []
      path = current_page == 1 ? File.join(site.dest, page.url, 'index.html') : File.join(site.dest, page.url, "#{current_page}/index.html")

      # Criação do payload compartilhado com dados relevantes.
      payload = site.site_payload.merge(
        "page" => page.to_liquid,
        "posts" => posts_for_page.map(&:to_liquid),
        "current_page" => current_page,
        "total_pages" => total_pages
      )

      # Renderiza o conteúdo e aplica layouts com o mesmo payload.
      content = render_content(site, page, payload)
      final_content = apply_layouts(site, content, page, payload)

      # Cria o arquivo com o conteúdo final.
      write_page(path, final_content)
    end

    # Método para renderizar o conteúdo usando Liquid e o payload fornecido.
    def render_content(site, page, payload)
      # Define as informações adicionais para a renderização.
      info = { "site" => site.config, "page" => page.data }
      # Renderiza o conteúdo usando o Liquid do Jekyll.
      rendered_content = site.liquid_renderer.file(page.path).parse(page.content).render!(payload, info)

      # Converte o Markdown renderizado em HTML.
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      converter.convert(rendered_content)
    end

    # Método para aplicar layouts ao conteúdo renderizado.
    def apply_layouts(site, content, page, payload, current_layout = nil)
      # Recupera o nome do layout atual.
      layout_name = current_layout || page.data["layout"]
      layout = site.layouts[layout_name]

      # Retorna o conteúdo se não houver layout definido.
      return content unless layout 

      # Atualiza o payload com o conteúdo atual para a renderização do layout.
      payload_with_content = payload.merge("content" => content)

      info = { "site" => site.config, "page" => page.data }

      # Renderiza o layout atual com o conteúdo embutido.
      rendered = site.liquid_renderer.file(layout.path).parse(layout.content).render!(payload_with_content, info)

      # Se o layout atual tiver outro layout pai, faz a recursão.
      if layout.data["layout"]
        apply_layouts(site, rendered, page, payload, layout.data["layout"])
      else
        rendered
      end
    end

    # Método para escrever o conteúdo gerado em um arquivo.
    def write_page(path, content)
      # Cria o diretório se não existir.
      FileUtils.mkdir_p(File.dirname(path))
      # Escreve o conteúdo no arquivo.
      File.write(path, content)
    end
  end
end