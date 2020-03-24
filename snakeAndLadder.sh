#!/bin/bash -x
#Program for Snake and Ladder Simulator
#Constants
WINNING_POSITION=100
POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
#Variables
position=0
ladderCount=0
snakeCount=0
dieCountForPlayer1=0
dieCountForPlayer2=0
positionForPlayer1=0
positionForPlayer2=0
echo "Welcome to Snake Ladder Game"
function play()
{
	position=$1
	#Roll a die to get random number between 1 to 6
	dieOutcome=$((RANDOM%6+1))
	#echo "Rolling die Outcome::" $dieOutcome
	#Check for options NO_PLAY/LADDER/SNAKE
	optionCheck=$((RANDOM%3))
	case $optionCheck in
		$NO_PLAY) 
			position=$position ;;
		$LADDER)
			#Exact winning condition
			if(( $((position+dieOutcome))>100 ))
			then
				position=$position
			else
				position=$((position+dieOutcome))
				position=$position
			fi ;;
		$SNAKE)
			#Exact restart condition 
			if (( $position > $dieOutcome ))
			then
				position=$position
			else
				position=$POSITION
			fi ;;
	esac
	echo $position
}
#Play the game with two player
while(($positionForPlayer1!=$WINNING_POSITION && $positionForPlayer2!=$WINNING_POSITION))
do
	((dieCountForPlayer1++))
	positionForPlayer1="$(play $positionForPlayer1)"
	trackPositionForPlayer1[$dieCountForPlayer1]=$((positionForPlayer1))
	((dieCountForPlayer2++))
	positionForPlayer2="$(play $positionForPlayer2)"
	trackPositionForPlayer2[$dieCountForPlayer2]=$((positionForPlayer2))
done

# Condition to know which player win
if(($positionForPlayer1==$WINNING_POSITION))
then
	echo "Congractulations...player 1 won. you rolled the die for $dieCountForPlayer1 times"
	for count in ${!trackPositionForPlayer1[@]}
	do
		echo "Position at die count $count : ${trackPositionForPlayer1[count]}"
	done
else
	echo "Congratulations...player 2 won. you rolled the die for $dieCountForPlayer2 times"
	for count in ${!trackPositionForPlayer2[@]}
	do
		echo "Position at die count $count : ${trackPositionForPlayer2[count]}"
	done
fi
