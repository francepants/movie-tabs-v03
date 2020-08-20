class MoviesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_movie, except: [:index, :new, :create]

    def new
        @movie = Movie.new
    end

    def create
        @movie = current_user.movies.build(movie_params)
        if @movie.save
            redirect_to movies_path
        else
            render :new
        end
    end

    private
    def set_movie
        @movie = Movie.find_by_id(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :length, :genre, :rating, :release_year, :search)
    end
    
end
