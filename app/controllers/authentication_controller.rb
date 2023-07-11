class AuthenticationController < ApplicationController
    #  skip request auth for user auth
    skip_before_action :authorize_request, only: :authenticate

    # auth token is being returned once user is authenticated
    def authenticate
        auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        time = Time.now + 24.hours.to_i 
        json_response(auth_token: auth_token, exp: time.strftime("%m-%d-%Y %H:%M"))
    end

    def destroy
        # invalidate the JWT token or clear the user's session
        token = request.headers['Authorization'].split(' ').last

        # check if the token is blacklisted
        if JsonWebToken.blacklisted?(token)
            json_response({ message: 'Token already invalidated' })
        else
            JWTBlacklist.create(token: token)
            json_response({ message: 'Logout successful' })
        end
    end

    private

    def auth_params
        params.permit(:email, :password)
    end
end
