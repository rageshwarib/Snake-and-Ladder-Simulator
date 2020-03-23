#!/bin/bash -x
#Program for Snake and Ladder Simulator
#Variables
POSITION=0
position=0
NO_PLAY=0
LADDER=1
SNAKE=2
ladderCount=0
snakeCount=0
echo "Welcome to Snake Ladder Game"

#Roll a die to get random number between 1 to 6
dieOutcome=$((RANDOM%6+1))
echo "Rolling die Outcome is::" $dieOutcome

#Check for options
optionCheck=$((RANDOM%3))
case $optionCheck in
	$NO_PLAY)
		echo "Current Position::" $position
		echo "You stays in a same position::"$position ;;
	$LADDER)
		((ladderCount++))
		echo "Current Position::" $position
		position=$((position+dieOutcome))
		echo "Your encountered a Ladder...New position::" $position ;;
	$SNAKE)
		((snakeCount++))
		echo "current Position::" $position
		position=$((position-dieOutcome)) 
		if (( $position < 0 ))
		then
			echo "You encountered a snake...New position::" $POSITION
		else
			echo "You encountered a snake...New position::" $position
		fi
esac
