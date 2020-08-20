class SessionsController < ApplicationController
    def home

    end

    def new

    end

    def create
        # binding.pry
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password]) #if finds user AND password authenticates
            session[:user_id] = user.id
            redirect_to user_path(user) #orrr '/users/#{user.id}'
        else
            flash[:message] = "Email or password incorrect. Please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end
