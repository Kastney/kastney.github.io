module Jekyll::CustomFilter
    def link_to(input, href)
      "<a class=\"ol.bibliography\" href=\"#{href}\">#{input}</a>"
    end
end
  
Liquid::Template.register_filter(Jekyll::CustomFilter)