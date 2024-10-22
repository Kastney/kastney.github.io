module Jekyll
    class CustomPermalink < Generator
        safe true  # Marca o gerador como seguro, permitindo sua utilização em sites Jekyll.
  
        # Método principal que registra a lógica de geração de permalinks personalizados.
        def generate(site)
            # Encontra a página de certificados na coleção de páginas do site.
            page = site.pages.find { |page| page.data['posters'] == 'certificates' }
  
            # Se a página de certificados for encontrada.
            if page
                # Geração de permalinks para a coleção de certificados em português (br).
                site.collections["certificates_br"].docs.each do |doc|
                    if doc.data['code']
                        # Obtém o permalink base da página de certificados.
                        base_permalink = page.data['permalink']
                        # Constrói o permalink final adicionando o código do documento.
                        doc.data['permalink'] = "#{base_permalink}#{doc.data['code']}/"
                    end
                end
  
                # Geração de permalinks para a coleção de certificados em inglês (us).
                site.collections["certificates_us"].docs.each do |doc|
                    if doc.data['code']
                        # Obtém o permalink base da página de certificados em inglês.
                        base_permalink = page.data['permalink_us']
                        # Constrói o permalink final adicionando o código do documento.
                        doc.data['permalink'] = "#{base_permalink}#{doc.data['code']}/"
                    end
                end
            end
        end
    end
end  