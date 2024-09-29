require 'fileutils'

module Jekyll
    class CleanAssets < Generator
        safe true

        def generate(site)
            Jekyll::Hooks.register :site, :post_write do |_site|
                if site.config['lang'] == 'us'
                    assets_path = File.join(site.dest, 'assets')
                    css_path = File.join(assets_path, 'css')
                    if Dir.exist?(css_path) && !Dir[File.join(css_path, '*.css')].empty?
                        FileUtils.rm_rf(css_path)
                    end
                    if Dir.exist?(assets_path) && Dir.empty?(assets_path)
                        FileUtils.rm_rf(assets_path)
                    end
                end
            end
        end
    end
end