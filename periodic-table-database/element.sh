#!/bin/bash

PSQL='psql --username=freecodecamp --dbname=periodic_table -t -A -c'
NOT_FOUND='I could not find that element in the database.'

ELEMENT() {
  ATOMIC_NUMBER="$1"
  SYMBOL="$2"
  NAME="$3"

  # query the properties
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")

  echo $PROPERTIES | while IFS='|' read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  do
    # query the type
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID;")

    # echo the information
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

if [[ -z $1 ]]
then
  echo 'Please provide an element as an argument.'
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # query an element by the number
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1;")
  
  echo $ELEMENT | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
  do
    # if element not found
    if [[ -z $ATOMIC_NUMBER ]]
    then
      # echo message
      echo $NOT_FOUND
    else
      ELEMENT $ATOMIC_NUMBER $SYMBOL $NAME
    fi
  done
elif [[ $1 =~ ^[A-Z]$|^[A-Z][a-z]+$ ]]
then
  # query elements
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1' OR name = '$1';")

  echo $ELEMENT | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
  do
    # if element not found
    if [[ -z $ATOMIC_NUMBER ]]
    then
      # echo message
      echo $NOT_FOUND
    else
      ELEMENT $ATOMIC_NUMBER $SYMBOL $NAME
    fi
  done
else
  echo $NOT_FOUND
fi
