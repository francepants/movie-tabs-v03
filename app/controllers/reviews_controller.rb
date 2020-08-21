class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :current_user, only: [:edit, :update, :destroy]
    before_action :set_review, except: [:index, :new, :create]

    def index
        # if its nested AND if we can find that post 
        if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
            @reviews = @movie.reviews
        else
            @reviews = Review.order_by_date
        end
    end

    def new
        if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
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

    def show
        if @review.blank?
            redirect_to reviews_path
        end
    end

    def edit

    end

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review.delete
        redirect_to reviews_path
    end

    private
    def set_review
        @review = Review.find_by_id(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :comment, :recommend, :movie_id, :user_id)
    end
end
