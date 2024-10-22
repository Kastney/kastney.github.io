module Jekyll
    class TranslationsLoader  
        # Registra um hook para o evento de pré-renderização do site.
        Jekyll::Hooks.register :site, :pre_render do |site|
            # Itera sobre cada idioma definido na configuração do site.
            site.config['languages'].each do |lang|
                # Monta o caminho do arquivo de traduções correspondente ao idioma atual.
                translations_file = File.join(site.source, "_i18n", "#{lang}.yml")
  
                # Verifica se o arquivo de traduções existe.
                if File.exist?(translations_file)
                    # Carrega o conteúdo do arquivo YAML de traduções.
                    translations_content = YAML.load_file(translations_file)
  
                    # Armazena o conteúdo das traduções na configuração do site, usando o idioma como chave.
                    site.config['translations'][lang] = translations_content
                end
            end
        end
    end
end  