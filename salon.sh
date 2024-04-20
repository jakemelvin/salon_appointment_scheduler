#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#gestion d'un salon de coiffure
echo -e "\n\n~~~~~ My Salon ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nWelcome to My Salon, how can I help you?"
  AFFICHAGE_SERVICE=$($PSQL "SELECT * FROM services ORDER BY service_id")
  echo "$AFFICHAGE_SERVICE" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT_SERVICE $SERVICE_ID_SELECTED ;;
    2) COLOR_SERVICE $SERVICE_ID_SELECTED ;;
    3) PERM_SERVICE $SERVICE_ID_SELECTED ;;
    4) STYLE_SERVICE $SERVICE_ID_SELECTED ;;
    5) TRIM_SERVICE $SERVICE_ID_SELECTED ;;
    *) MAIN_MENU "Please chose a valid option for the service!" ;;
  esac
}
CUT_SERVICE(){
  echo -e "\nYou've decided to cut your hair. That's great!"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your cut? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nWhat time would you like your cut? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  
}
COLOR_SERVICE(){
  echo -e "\nYou've decided to color your hair. That's great!"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your color? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nWhat time would you like your color? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
PERM_SERVICE(){
  echo -e "\nYou've decided to perm your hair. That's great!"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your perm? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nWhat time would you like your perm? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
STYLE_SERVICE(){
  echo -e "\nYou've decided to style your hair. That's great!"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your style? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nWhat time would you like your style? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
TRIM_SERVICE(){
  echo -e "\nYou've decided to trim your hair. That's great!"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your trim? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nWhat time would you like your trim? $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$1)")
    echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
MAIN_MENU