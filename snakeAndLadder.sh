#!/bin/bash -x
#Program for Snake and Ladder Simulator
#Variables
position=0
echo "Welcome to Snake Ladder Game"

#Roll a die to get random number between 1 to 6
dieOutcome=$((RANDOM%6+1))
echo $dieOutcome
