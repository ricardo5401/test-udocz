class Network
    def self.API_URL
        ENV['API_URL'] || "https://api-staging.udocz.com/v1/"
    end

    def self.BASE_URL
        ENV['BASE_URL'] || "http://localhost:3000"
    end

    def self.P2H_URL 
		"http://p2h.udocz.com"
	end
end