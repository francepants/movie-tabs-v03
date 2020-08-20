class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #helper gives access to methods in the views

    private
    def current_user
        # if @current user is already defined then it will = @current user or it will find by id in users table
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? 
    end

end
