#!/bin/bash -x
#Program for Snake and Ladder Simulator
#Constants
WINNING_POSITION=100
POSITION=0
#Variables
position=0
NO_PLAY=0
LADDER=1
SNAKE=2
ladderCount=0
snakeCount=0
echo "Welcome to Snake Ladder Game"

#Winning condition
while(($position!=$WINNING_POSITION))
do
	#Roll a die to get random number between 1 to 6
	dieOutcome=$((RANDOM%6+1))
	echo "Rolling die Outcome::" $dieOutcome
	#Check for options
	optionCheck=$((RANDOM%3))
	case $optionCheck in
		$NO_PLAY)
			echo "Current Position::" $position
			echo "You stays in a same position::"$position 
			position=$position ;;
		$LADDER)
			echo "Current Position::" $position
			echo "You encountered a Ladder"
			#Exact winning condition
			if(( $((position+dieOutcome))>100 ))
			then
				position=$position
				echo "Current position::"$position
			else
				position=$((position+dieOutcome))
				position=$position
				echo "New position::" $position
			fi ;;
		$SNAKE)
			echo "current Position::" $position
			echo "You encountered a Snake"
			#Exact restart condition 
			if (( $position < 0 ))
			then
				echo "New position::" $POSITION
				position=$POSITION
			else
				position=$((position-dieOutcome))
				echo "New position::" $position
				position=$position
			fi ;;
	esac
done
