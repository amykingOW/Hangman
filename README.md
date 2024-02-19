# Hangman
Welcome to the Hangman game built using Ruby on Rails! This classic word-guessing game challenges you to guess the hidden word before you run out of attempts. You start with 9 lives, and with every wrong guess, you'll lose a life. You cannot guess the same letter twice.

# How to Play
1. Clone the repo and navigate to the directory
2. Ensure Ruby and Rails are installed on your machine
3. Start up the web server using bin/rails server
4. Open a web browser and navigate to http://localhost:3000 to access the Hangman game
5. Once loaded, click on "Start New Game"
6. Type in the name of your game and then press "Create Game
7. Start guessing letters to uncover the hidden word
8. You can delete the game or go back to saved games to start a new game

## Running Tests
Tests files for models and requests are included in the spec folder. Ensure rspec is installed on your machine. Model tests can be executed by running `bundle exec rspec spec/models`. Request tests can be executed by running `bundle exec rspec spec/requests`.
