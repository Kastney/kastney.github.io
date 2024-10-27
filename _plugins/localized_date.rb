module Jekyll
    module LocalizedDate
        MONTHS = {
            "pt-br" => %w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro],
            "en-us" => %w[January February March April May June July August September October November December]
        }
  
        def localized_date(date, lang = "en-us")
            parsed_date = Time.parse(date.to_s)
  
            day = parsed_date.strftime("%d").to_i
            month = MONTHS[lang][parsed_date.strftime("%m").to_i - 1]
            year = parsed_date.strftime("%Y")
  
            if lang == "pt-br"
                "#{day} de #{month} de #{year}"
            elsif lang == "en-us"
                "#{month} #{day}, #{year}"
            else
                "Unsupported language"
            end
            rescue
            "Invalid date"
        end
    end
end
  
Liquid::Template.register_filter(Jekyll::LocalizedDate)  