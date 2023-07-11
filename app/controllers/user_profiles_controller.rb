class UserProfilesController < ApplicationController

    before_action :authorize_request
    #set_user_profile is called before show, update, destroy actions
    before_action :set_user_profile, only: [:show, :update, :destroy]

    def show
        json_response(@user_profile)
    end

    def create
        @user_profile = UserProfile.create!(user_profile_params)
        json_response(@user_profile, :created) # renders with status ":created"
    end

    def update
        @user_profile.update(user_profile_params)
        # head :no_content # indicates success without returning a response body
        json_response(@user_profile)
    end

    def destroy
        @user_profile.destroy
        head :no_content
    end

    private # private method -- permits user profile params

    def user_profile_params
        params.permit(:full_name, :address, :phone_number).merge(user_id: current_user.id)
    end

    def set_user_profile
        # @user_profile = UserProfile.find_by(user_id: current_user.id)
        @user_profile = current_user.user_profile
    end
end