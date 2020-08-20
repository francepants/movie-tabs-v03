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

    def omniauth
        #find_or_create a user using the attributes auth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.username = auth["info"]["name"]
          user.password = SecureRandom.hex
        end
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to '/'
        end
      end
    
      private
    
      def auth
        request.env['omniauth.auth']
      end
end
