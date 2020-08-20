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
    - can add / create reviews 
    - can see a list of movie reviews 
    - can see a list of selected movies reviews
    - edit/update only current_users reviews
    - can delete current_users reviews

- User
    - can sign up - DONE
    - can log in - DONE
    - can log out - DONE

    - log in through google 

## Other
- Genres
    Action, Horror, Comedy, Sci-Fi, Romance, Western, Crime, Rom-Com, Thriller, Adventure, Musical, Drama, Documentary, Mystery, Noir, Martial Arts, Slasher, Fantasy, Dark Comedy, Children's, Biographical, Fiction, Parody, Indie, Superhero, Gangster, Chick Flick, Teen


<%= link_to "Sign Up", signup_path, method: :get%> |
<%= link_to "Log In", login_path, method: :get%>
<%= link_to "Log Out", logout_path, method: "delete" %>