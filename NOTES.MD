# Movie Tabs
- a place where users can keep tabs on movies
- user can 
    - sign up
    - log in
    - log in with google
    - log out
    - add movies
    - review movies

## Models
- User
   -  username
   -  email
   -  password_digest
   -  about me
- Reviews
    - title
    - comment
    - review_date
    - recommend yes or no
        - or can do emojis
        - or something similar
- Movies
    - title
    - length
    - genre
    - Rating (g, pg, pg13, r ...)
    - release_year

## Associations
- Users
    - has_many :reviews
    - has_many :movies, through: :reviews

- Reviews (join table)
    - belongs_to :user
    - belongs_to :movie

- Movies
    - has_many :reviews
    - has_many :users, through: :reviews

## Check list
- Movie
    - can add / create a movie - DONE
    - can see a list of all movies added - DONE
    - show individual movie info - DONE
    - edit / update movie - DONE
    - delete movie - DONE
    - search through movie titles - DONE

- Review
    - can add / create reviews - DONE
    - can see a list of movie reviews - DONE
    - edit/update only current_users reviews - DONE
    - can delete current_users reviews - DONE
    - can see a list of selected movies reviews - Done


- User
    - can sign up - DONE
    - can log in - DONE
    - can log out - DONE
    - log in through google - DONE


- Add validations - DONE

- Partials


## Other
- Genres
    Action, Horror, Comedy, Sci-Fi, Romance, Western, Crime, Rom-Com, Thriller, Adventure, Musical, Drama, Documentary, Mystery, Noir, Martial Arts, Slasher, Fantasy, Dark Comedy, Children's, Biographical, Fiction, Parody, Indie, Superhero, Gangster, Chick Flick, Teen


<%= link_to "Sign Up", signup_path, method: :get%> |
<%= link_to "Log In", login_path, method: :get%>
<%= link_to "Log Out", logout_path, method: "delete" %>


## nav bar

<nav class="navbar navbar-dark bg-dark">
      <a class="navbar-brand" href="/">MovieTabs</a>
      <div class="btn-group" role="group">
          <% if logged_in? %>
                <%= link_to "My Profile", user_path(current_user), :class => "btn btn-secondary link_text"%>
                <%= link_to "All Movies", movies_path, :class => "btn btn-secondary"%>
                <%= link_to "Add Movie", new_movie_path, :class => "btn btn-secondary"%>
                <%= link_to "All Reviews", reviews_path, :class => "btn btn-secondary"%>
                <%= link_to "Add Review", new_review_path, :class => "btn btn-secondary"%>
                <%= link_to "Log Out", logout_path, method: "delete", :class => "btn btn-secondary"%> 
          <% else %>
            <%# <%= link_to "Home", root_path, :class => "link_text" %> 
            <%= link_to "Sign Up", signup_path, :class => "link_text" %> |
            <%= link_to "Log In", login_path, :class => "link_text" %> | 
            <%= link_to "Log In with Google", '/auth/google_oauth2', :class => "link_text" %>
          <% end %>
      </div>   
</nav>


#### was in application.html.erb
    <div>
      <% if flash[:message] %>
          <%= flash[:message]%>
      <% end %>
      <%= @error%>
    </div>

#### movie controller def index for search

        # if params[:user_id] && @user = User.find_by_id(params[:user_id]) 
        #     @movies = @user.movies
        # else
        #     @movies = Movie.search(params[:term])
        # end
        
        if params[:term]
            @movies = Movie.search(params[:term])
        else
            @movies = Movie.sorted_movies
        end