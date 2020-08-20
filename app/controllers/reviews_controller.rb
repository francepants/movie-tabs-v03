class ReviewsController < ApplicationController
    before_action :current_user, only: [:edit, :update, :destroy]

    def index
        # if its nested AND if we can find that post 
        if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
            @reviews = @movie.reviews
        else
            @reviews = Review.all
        end
    end

    def new
        if params[:movie_id] && @movie = Movie.find_by_id[:movie_id]
            @review = @movie.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        @review.user = current_user
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end

    private
    def set_review
        @review = Review.find_by_id(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :comment, :recommend, :movie_id, :user_id)
    end
end
