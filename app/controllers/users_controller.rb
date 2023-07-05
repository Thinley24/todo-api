class UsersController < ApplicationController
    
    # POST /signup endpoint
    def create
        @user = User.new(user_params)
        if @user.save
            # render json: user, status: :created
            json_response(@user, :created)
        else
            json_response({ error: @user.errors.full_messages.join(', ') }, :unprocessable_entity)
        end
    end

    private
    def user_params
        params.permit(:name, :email, :password)
    end
end
