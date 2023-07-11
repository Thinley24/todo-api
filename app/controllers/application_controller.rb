class ApplicationController < ActionController::API
    # importing Response and Exception concern modules
    include Response
    include ExceptionHandler
end
