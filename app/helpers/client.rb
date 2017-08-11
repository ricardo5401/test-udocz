class Client
    require 'httparty'
    include HTTParty

    default_options.update(verify: false)
end