class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  # user and admin models are not loading because of name(if you rename model it'll work) otherwise we have to explictly include the models
  require 'user'

  layout 'application'
   
  helper_method :current_user
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = AuthenticateApiRequest.call(request.headers).result
    #(current_user_session && current_user_session.record)
    # unless @current_user
    #   @current_user = authenticate_request
    # end
    # @cuurent_user ||= authenticate_request

  end

  def authenticate_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end


  def current_user_XXX
    return @current_user if defined?(@current_user)
    headers =request.headers.result.to_s
    @current_user = User.find_by_id(http_auth_header) if http_auth_header
    @current_user || errors.add(:id, 'Invalid id') && nil
    #(current_user_session && current_user_session.record)
    # unless @current_user
    #   @current_user = authenticate_request
    # end
    # @cuurent_user ||= authenticate_request
  end
    

end



