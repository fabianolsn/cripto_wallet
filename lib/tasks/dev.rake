namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if  Rails.env.development?
      show_spinner("Apagando BD"){%x(rails db:drop)}
      show_spinner("Criando BD"){%x(rails db:create)}
      show_spinner("Migrando BD"){%x(rails db:migrate)}
      %x(rails dev:add_mining_type)
      %x(rails dev:add_coins)
    else
      puts "no esta em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas")do
      coins = [
        {  description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://img2.gratispng.com/20180604/zya/kisspng-bitcoin-com-cryptocurrency-logo-zazzle-kibuba-btc-5b15aa1f157d09.468430171528146463088.jpg",
          mining_type: MiningType.all.sample
        },
        {
          description: "Ethereum",
          acronym: "ETC",
          url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "BNB",
          acronym: "BNB",
          url_image: "https://w7.pngwing.com/pngs/417/252/png-transparent-binance-crypto-binance-symbol-binance-sign-binance-logo-binance-coin-binance-3d-icon-thumbnail.png",
          mining_type: MiningType.all.sample
        }
      ]

        coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro de tipos de mineraçao"
  task add_mining_type: :environment do
    show_spinner("Cadastro de tipos de mineracao")do
      mining_types = [
        {description: "proof of work", acronym: "PoW"},
        {description: "proof of stake", acronym: "PoS"},
        {description: "proof of capacity", acronym: "PoC"}
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end



  private
  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :pulse_2)
    spinner.auto_spin
    sleep(2)
    yield
    spinner.success("(Sucesso)")
  end
end

