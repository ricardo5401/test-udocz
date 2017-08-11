 class ReadService
    attr_reader :document_title

    def initialize(params)
        @document_title = params[:title_url]
    end

    def call
        document_title ? result : bad_request
    end

    def result
        result = Client.get(Network.API_URL + "read/" + document_title)
        response_objects = JSON.parse(result.response.body)
        if result.code == 200 && response_objects && response_objects["document"]
            response_objects
        else
            bad_request
        end
    end

    def bad_request
        { status: 404 }
    end
end