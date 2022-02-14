# frozen_string_literal: true

url = if ENV['HEROKU_APP_NAME']
        "#{ENV['HEROKU_APP_NAME']}.herokuapp.com"
      elsif ENV['APP_URL']
        ENV['APP_URL']
      else
        'http://localhost:3000'
      end

uri = URI(url)

Rails.application.routes.default_url_options = { host: uri.host,
                                                 port: uri.port,
                                                 protocol: uri.scheme }


Rails.application.config.action_mailer.asset_host = url
Rails.application.config.action_mailer.default_url_options = { host: uri.host,
                                                 port: uri.port,
                                                 protocol: uri.scheme }
