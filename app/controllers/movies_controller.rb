class MoviesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_movie, except: [:index, :new, :create]

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @movies = @user.movies
        else
            @movies = Movie.all
        end
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = current_user.movies.build(movie_params) #built off of user
        if @movie.save
            redirect_to movies_path
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @movie.update(movie_params)
            redirect_to movie_path
        else
            render :edit
        end
    end

    def destroy
        @movie.destroy
        redirect_to movies_path
    end

    private
    def set_movie
        @movie = Movie.find_by_id(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :length, :genre, :rating, :release_year, :search)
    end
    
end
