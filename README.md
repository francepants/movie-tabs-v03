# README
Welcome to movie tabs!

Franceline's Flatiron Schools Mod 3 project built with Ruby on Rails!

To get google authentication to work:
- add a .env file to project
- add this to the .env: 
  GOOGLE_CLIENT_ID=Your client id
  GOOGLE_CLIENT_SECRET=Your client secret
- go to Go to 'https://console.developers.google.com'
- get client id and clent secret add these to .env file

Then
- add the .env to the gitignore
- bundle install
- rails db:migrate
- rails s

- navigate to localhost:3000 
