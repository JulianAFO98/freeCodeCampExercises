#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=players -t --no-align -c"


RANDOM_NUMBER=$((RANDOM % 1000 + 1))
#ESTO ES UN COMENTARIO
echo -e "\nWelcome to the guessing game\n"
echo "Enter your username:"
read USERNAME
SELECT_USERNAME_RESULT=$($PSQL "SELECT * FROM players WHERE username='$USERNAME';")
if [[ -z $SELECT_USERNAME_RESULT ]]; then 
     echo Welcome, $USERNAME! It looks like this is your first time here.
else 
    IFS="|" read -r PLAYER_ID PLAYER_USERNAME GAMES_PLAYED BEST_GAME  <<< "$SELECT_USERNAME_RESULT";
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo -e "\nGuess the secret number between 1 and 1000:"
GUESS_COUNT=1
read GUESS
 #BUCLE POR SI EL JUGADOR INGRESO MAL LAS X PRIMERAS ENTRADAS (LETRAS O CARACTERES)
while [[ ! $GUESS =~ ^[0-9]+$ ]]
 do 
  echo "That is not an integer, guess again:"
  ((GUESS_COUNT+=1))
  read GUESS
 done

while [[ $RANDOM_NUMBER -ne $GUESS ]]
 do
  ((GUESS_COUNT+=1))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else  
   if (( GUESS < RANDOM_NUMBER));then
    echo "It's higher than that, guess again:"
   else 
     if (( GUESS > RANDOM_NUMBER));then
       echo "It's lower than that, guess again:"
     fi
   fi
  fi 
   read GUESS    
 done

echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
#Esto funciona bien, se puede mejorar
if [[ -z $SELECT_USERNAME_RESULT ]]; then 
   INSERT_NEW_PLAYER_DATA_RESULT=$($PSQL "INSERT INTO players(username,games_played,best_game) VALUES('$USERNAME',1,$GUESS_COUNT);")
else 
   ((GAMES_PLAYED+=1))
   if ((BEST_GAME>GUESS_COUNT)); then 
    BEST_GAME=$GUESS_COUNT
   fi
  UPDATE_OLD_PLAYER_DATA_RESULT=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED,best_game=$BEST_GAME WHERE username='$USERNAME';")
fi

