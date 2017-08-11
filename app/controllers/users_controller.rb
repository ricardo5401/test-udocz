class UsersController < ApplicationController
    def show
        result = Client.get(Network.API_URL + "users/" + params[:user])
        user = JSON.parse(result.response.body)
        if result.code == 200 && user && user["id"]
            @metas[:title] = (user["full_name"] || user["username"]) + " - uDocz"
            @metas[:description] = user["description"] if user["description"]
            @metas[:url] = Network.BASE_URL + "/profile/" + user["username"]
            @metas[:keywords] += ", " + user["username"]
            @username = user["username"]
        else
            redirect_to "/404"
        end
    end
    
    def notifications
    end
end
