require 'fileutils'  # Requer a biblioteca FileUtils para operações de manipulação de arquivos e diretórios.

module Jekyll
    class CleanAssets < Generator
        safe true  # Marca o gerador como seguro, permitindo sua utilização em sites Jekyll.

        # Método principal que registra um hook para o evento de pós-escrita do site.
        def generate(site)
            Jekyll::Hooks.register :site, :post_write do |_site|
                # Verifica se a configuração de idioma do site é 'us'.
                if site.config['lang'] == 'us'
                    # Define o caminho para a pasta de assets e a subpasta de CSS.
                    assets_path = File.join(site.dest, 'assets')
                    css_path = File.join(assets_path, 'css')

                    # Verifica se a pasta CSS existe e se contém arquivos CSS.
                    if Dir.exist?(css_path) && !Dir[File.join(css_path, '*.css')].empty?
                        # Remove recursivamente a pasta CSS se houver arquivos CSS.
                        FileUtils.rm_rf(css_path)
                    end

                    # Verifica se a pasta de assets existe e está vazia.
                    if Dir.exist?(assets_path) && Dir.empty?(assets_path)
                        # Remove recursivamente a pasta de assets se estiver vazia.
                        FileUtils.rm_rf(assets_path)
                    end
                end
            end
        end
    end
end