#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#Clear tables
echo "$($PSQL "TRUNCATE teams, games;")"
#Read rows
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
#Skip first row
if [[ $YEAR != year ]]
then
#Populate teams
#Check first for all the winning teams
#Get winner team_id
WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
#If no team_id
if [[ -z $WINNER_ID ]]
then
#Insert team
echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
#Update winner_id
WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
fi
#Get opponent team_id
OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")"
#If no team_id
if [[ -z $OPPONENT_ID ]]
then
#Insert team
echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")"
#Update opponent_id
OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")"
fi
# Populate games
echo "$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS);")"
fi
done