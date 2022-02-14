require "uri"
require "json"
require "net/http"

class SlackNewUserService
  def initialize(attributes = {})
    @user = attributes[:user]
  end

  def call
    url = URI(ENV.fetch('SLACK_WEBHOOK_URL'))

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({
      "text": "Nouveau utilisateur: #{@user.email}",
    })

    response = https.request(request)
    puts response.read_body
  end
end
