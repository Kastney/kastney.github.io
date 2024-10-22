require 'fileutils'  # Requer a biblioteca FileUtils para operações de manipulação de arquivos e diretórios.

module Jekyll
    class CleanCollections < Generator
        safe true  # Marca o gerador como seguro, permitindo sua utilização em sites Jekyll.

        # Método principal que registra um hook para o evento de pós-escrita do site.
        def generate(site)
            Jekyll::Hooks.register :site, :post_write do |_site|
                # Encontra a página de certificados na coleção de páginas do site.
                page = site.pages.find { |page| page.data['posters'] == 'certificates' }

                # Se a página de certificados for encontrada.
                if page
                    # Verifica se a configuração de idioma do site é 'br'.
                    if site.config['lang'] == 'br'
                        # Remove recursivamente a pasta associada à versão em inglês dos certificados.
                        FileUtils.rm_rf(File.join(site.dest, page.data['permalink_us']))
                    elsif site.config['lang'] == 'us'
                        # Remove recursivamente a pasta associada à versão em português dos certificados.
                        FileUtils.rm_rf(File.join(site.dest, page.data['permalink']))
                    end
                end
            end
        end
    end
end