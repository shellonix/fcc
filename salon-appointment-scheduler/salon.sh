#!/bin/bash

PSQL='psql --username=freecodecamp --dbname=salon -t -A -c'

echo -e '\n~~~~~ Welcome to Salon ~~~~~\n'

LIST_SERVICES() {
  if [[ $1 ]]
  then
    echo -e "$1 What would you like today?\n"
  else
    echo -e 'Welcome to My Salon, how can I help you?\n'
  fi

  # list all the services
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SERVICES" | while IFS='|' read SERVICE_ID SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  # prompt to enter a service id
  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # list the services again
    LIST_SERVICES 'That is not a valid number.'
    
  else
    # get the name of the selected service
    SERVICE_TO_APPOINT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

    # if the service id is not valid
    if [[ -z $SERVICE_TO_APPOINT ]]
    then
      # list the services again
      LIST_SERVICES 'I could not find that service.'
    fi
  fi
}


LIST_SERVICES

# ask user's phone
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# if they aren't already a customer
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
if [[ -z $CUSTOMER_NAME ]]
then
  # ask customer's name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  # insert a customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

# ask time
echo -e "\nWhat time would you like your $SERVICE_TO_APPOINT, $CUSTOMER_NAME?"
read SERVICE_TIME

# insert an appointment
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME');")

# output message
echo -e "\nI have put you down for a $SERVICE_TO_APPOINT at $SERVICE_TIME, $CUSTOMER_NAME."

