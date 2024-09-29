require 'fileutils'

module Jekyll
    class CleanCollections < Generator
        safe true
  
        def generate(site)
            Jekyll::Hooks.register :site, :post_write do |_site|
                if site.config['lang'] == 'br'
                    FileUtils.rm_rf(File.join(site.dest, 'certificates'))
                elsif site.config['lang'] == 'us'
                    FileUtils.rm_rf(File.join(site.dest, 'certificados'))
                end
            end
        end
    end
end