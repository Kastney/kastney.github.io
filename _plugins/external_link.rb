module Jekyll
    class ExternalLinkTag < Liquid::Tag
        def initialize(tag_name, markup, tokens)
            super
            # Utiliza uma expressão regular para capturar os parâmetros `text` e `link`
            @text = markup[/text\s*=\s*"(.*?)"/, 1]
            @link = markup[/link\s*=\s*"(.*?)"/, 1]
        end
  
        def render(_context)
            # Gera o HTML para o link
            "<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"#{@link}\">#{@text}</a>"
        end
    end
end
  
# Registra a tag para que o Jekyll possa usá-la
Liquid::Template.register_tag('link_external', Jekyll::ExternalLinkTag)  