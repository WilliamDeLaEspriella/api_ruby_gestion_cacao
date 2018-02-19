class ApplicationController < ActionController::API
     attr_reader :current_user 
    
    private 
    def authenticate_producer
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' },status: 401 if !@current_user && @current_user.producer?
    end 
    
    def authenticate_association
        @current_user = AuthorizeApiRequest.call(request.headers).result 
        render json: { error: 'Not Authorized' },status: 401 if !@current_user && @current_user.association?
    end 
end
