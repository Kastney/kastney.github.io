require 'fileutils'

module Jekyll
    class CleanCollections < Generator
        safe true
  
        def generate(site)
            Jekyll::Hooks.register :site, :post_write do |_site|
                # certificates page
                page = site.pages.find { |page| page.data['posters'] == 'certificates' }
                if page
                    if site.config['lang'] == 'br'
                        FileUtils.rm_rf(File.join(site.dest, page.data['permalink_us']))
                    elsif site.config['lang'] == 'us'
                        FileUtils.rm_rf(File.join(site.dest, page.data['permalink']))
                    end
                end
            end
        end
    end
end