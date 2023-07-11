class ApplicationController < ActionController::API
    # importing Response and Exception concern modules
    include Response
    include ExceptionHandler

    # called before every action on controllers
    before_action :authorize_request # setup a before action filter 'authorize_request'
    attr_reader :current_user # getter method - accessing 'current_user'

    private
    
    # checks for valid request token and returns user
    def authorize_request # called before action filter
        # instantiates AuthorizeApiRequest -- validates req token
        # assigns :user key from result of call method
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
