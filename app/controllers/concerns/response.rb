# creating a 'json_response' concern that parses json response to a Ruby hash
module Response
    def json_response(object, status = :ok)
        render json: object, status: status
    end
end

