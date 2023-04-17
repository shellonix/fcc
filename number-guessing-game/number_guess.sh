#!/bin/bash

PSQL='psql --username=freecodecamp --dbname=number_guess -t -A -c'

# a random between 1 and 1000
ANSWER=$(($RANDOM % 1000 + 1))

# ask for username
echo 'Enter your username:'
read USERNAME

# query user
USER_QUERY=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME';")

echo $USER_QUERY | while IFS='|' read USER_ID GAMES_PLAYED BEST_GAME
do
  # if username exists
  if [[ $USER_ID ]]
  then
    # print user details
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    # create a user
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")

    # print welcome message
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi
done

# ask for guessed number
echo 'Guess the secret number between 1 and 1000:'
read GUESS

NUMBER_OF_GUESSES=0

# if guess is wrong
while [[ $ANSWER != $GUESS ]]
do
  # if integer
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    # count # of guesses if valid
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

    # if lower
    if [[ $ANSWER -lt $GUESS ]]
    then
      # print message
      echo "It's lower than that, guess again:"
    elif [[ $ANSWER -gt $GUESS ]]
    then
      # print message
      echo "It's higher than that, guess again:"
    fi
  else
    # print message
    echo "That is not an integer, guess again:"
  fi

  # ask for guessed number again
  read GUESS
done

# if secret number is guessed
# count the last guess
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

# print result message
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $ANSWER. Nice job!"

# query user
USER_QUERY=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME';")

echo $USER_QUERY | while IFS='|' read USER_ID GAMES_PLAYED BEST_GAME
do
  # update games_played in psql
  UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = $(($GAMES_PLAYED + 1)) WHERE user_id = $USER_ID;")

  # if best game
  if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
  then
    # update best_game in psql
    UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID;")
  fi
done
