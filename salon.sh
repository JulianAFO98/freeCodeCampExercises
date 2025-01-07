#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"



MAIN_MENU() {

   SERVICES_INFO=$($PSQL "SELECT * FROM services")
   MAX_ID_FROM_SERVICES=$($PSQL "SELECT MAX(service_id) FROM services")

  if [[ ! -z $1 ]]
   then
    echo $1
  fi 

  echo -e '\nWhich service do you want to rent?\n'

  echo "$SERVICES_INFO" | while read SERVICE_ID BAR SERVICE_NAME
   do 
    echo "$SERVICE_ID) $SERVICE_NAME"
   done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ || (( $SERVICE_ID_SELECTED>$MAX_ID_FROM_SERVICES ))]]
   then 
    MAIN_MENU "You entered a wrong character"
  else 
    RENT_SERVICE $SERVICE_ID_SELECTED  
  fi  

}




RENT_SERVICE() {
 
 echo -e "\nWhat's your phone number?"
 read CUSTOMER_PHONE
 CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
 if [[ -z $CUSTOMER_ID ]] #Si no existe
   then 
     echo "I don't have a record for that phone number, what's your name?"
     read CUSTOMER_NAME
     RESULT_INSERT_CLIENT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
     CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
 else 
     CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
 fi  
  echo "What time would you like to schedule this service, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($1,$CUSTOMER_ID,'$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1")
  echo I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.
}


MAIN_MENU