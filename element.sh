#/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

#I Finished this program, at least for now

SHOW_ELEMENT_DATA() {
  if [[ -z $1 ]] 
   then 
    echo "I could not find that element in the database."
  else
    read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_SYMBOL BAR ATOMIC_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE <<< "$1"
    echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
  fi  
}


FIND_ELEMENT() {
  if [[ $1 =~ ^[0-9]+$ ]] 
   then
    SELECT_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")
  else 
    if [[ $1  =~ ^[A-Z][a-z]?$ ]]
     then 
      SELECT_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1';")
    else 
      if [[ $1 =~ ^[A-Z][a-z]+$ ]]
       then
        SELECT_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1';")
      fi  
    fi
  fi
  
  SHOW_ELEMENT_DATA "$SELECT_ELEMENT_RESULT"
}  



if [[ -z $1 ]] 
 then
  echo "Please provide an element as an argument."
else 
  FIND_ELEMENT $1
fi


