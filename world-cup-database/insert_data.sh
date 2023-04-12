#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty the rows in the tables
TRUNCATE_RESULT=$($PSQL "TRUNCATE TABLE games, teams;")

# Insert data from games.csv

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_QUERY_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_QUERY_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")

    if [[ -z $WINNER_QUERY_RESULT ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")
      if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        echo "Insert team $WINNER"
        WINNER_QUERY_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
      fi
    fi

    if [[ -z $OPPONENT_QUERY_RESULT ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');")
      if [[ $INSERT_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        echo "Insert team $OPPONENT"
        OPPONENT_QUERY_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
      fi
    fi

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', '$WINNER_QUERY_RESULT', '$OPPONENT_QUERY_RESULT', $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo "Insert game $YEAR $ROUND"
    fi
  fi
done
