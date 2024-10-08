module Jekyll
    class TranslationsLoader  
        Jekyll::Hooks.register :site, :pre_render do |site|
            site.config['languages'].each do |lang|
                translations_file = File.join(site.source, "_i18n", "#{lang}.yml")
                if File.exist?(translations_file)
                    translations_content = YAML.load_file(translations_file)
                    site.config['translations'][lang] = translations_content
                end
            end
        end
    end
end