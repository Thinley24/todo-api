class UsersController < ApplicationController
    
    # skip request auth for user signup action
    # skip_before_action :authorize_request, only: :create

    ## POST /signup endpoint

    ## following has no authentication
    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #         # render json: user, status: :created
    #         json_response(@user, :created)
    #     else
    #         json_response({ error: @user.errors.full_messages.join(', ') }, :unprocessable_entity)
    #     end
    # end

    # private
    # def user_params
    #     params.permit(:name, :email, :password)
    # end

    ## return authenticated token upon signup
    def create
        # binding.pry
        user = User.create!(user_params) # creating new user record and raise exception if it fails using active record 'create!'
        auth_token = AuthenticateUser.new(user.email, user.password).call #initializes instance and calls th call method
        response = { message: Message.account_created, auth_token: auth_token } # response hash created with keyy-value pair
        json_response(response, :created) # rendering
    end

    private

    def user_params # private method --> permits
        params.permit(
            :name,
            :email,
            :password,
            :password_confirmation,
            user_profile_attributes: [:full_name, :address, :phone_number] # permitting user profile attributes as well
        )
    end
end


