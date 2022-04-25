module ApplicationHelper
    def locale
        puts I18n.locale
        I18n.locale == :en ? "Estados Unidos" : "Portugues do Brasil"
    end

    def data_br(data_us)
        data_us.strftime("%d/%m/%y")
    end

    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produçao"
        else
            "Teste"
        end
    end
end
