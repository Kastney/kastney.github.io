require 'time'

module Jekyll
    module ExtractHoursFilter
        def extract_hours(date_str)
            # Expressão regular para capturar: YYYY-MM-DDTHH:MM:SS
            if date_str =~ /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})$/
                # Obtém o ano
                year = $1
                aux_year = [1, year.to_i].max # Ano mínimo é 1
                # Obtém o mês
                month = $2
                aux_month = limit_value(month.to_i, 1, 12) # Mês entre 1 e 12
                # Obtém o dia
                day = $3
                aux_day = limit_value(day.to_i, 1, 31) # Dia entre 1 e 31
                # Obtém a hora
                hour = $4
                aux_hour = limit_value(hour.to_i, 0, 23) # Hora entre 0 e 23
                # Obtém o minuto
                aux_minute = limit_value($5.to_i, 0, 59) # Minuto entre 0 e 59
                # Obtém o segundo
                aux_second = limit_value($6.to_i, 0, 59) # Segundo entre 0 e 59

                # Tenta criar uma instância de Time para validar a data e hora
                begin
                    Time.new(aux_year, aux_month, aux_day, aux_hour, aux_minute, aux_second)
                rescue ArgumentError
                    return -1
                end

                # Converte tudo para horas (desconsiderando o ajuste de ano mínimo)
                total_hours = ((year.to_i * 365 + month.to_i * 30 + day.to_i) * 24) + hour.to_i

                return total_hours.to_s
            else
                return -1
            end
        end

        # Função auxiliar para limitar valores a um intervalo específico
        def limit_value(value, min, max)
            [[value, min].max, max].min
        end
    end
end

Liquid::Template.register_filter(Jekyll::ExtractHoursFilter)