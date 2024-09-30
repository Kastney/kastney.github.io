module Jekyll
    class CustomPermalink < Generator
        safe true
    
        def generate(site)
            # certificates page
            page = site.pages.find { |page| page.data['posters'] == 'certificates' }
            if page
                site.collections["certificates_br"].docs.each do |doc|
                    if doc.data['code']
                        base_permalink = page.data['permalink']
                        doc.data['permalink'] = "#{base_permalink}#{doc.data['code']}/"
                    end
                end
                site.collections["certificates_us"].docs.each do |doc|
                    if doc.data['code']
                        base_permalink = page.data['permalink_us']
                        doc.data['permalink'] = "#{base_permalink}#{doc.data['code']}/"
                    end
                end
            end
        end
    end
end  