#!/bin/bash -x

var="Welcome to snake and ladder game"
echo "$var"

INITIAL_POSITION=0;
WINNING_POSITION=100;
NUMBEROFPLAYER=1;
firstPlayerPosition=$INITIAL_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2; 


function moveCondition(){

	if [ $1 -le 0 ]
	then
		echo $1=$INITIAL_POSITION;
	elif [ $1 -ge $WINNING_POSITION ]
	then
		echo win;
	fi 
}

while [ $firstPlayerPosition -le $WINNING_POSITION ]
do
	randomDieMove=$((RANDOM%6+1))
	Option=$((RANDOM%3))
	case $Option in
	$NOPLAY)
		firstPlayerPosition=$firstPlayerPosition
		;;

	$LADDER)
		firstPlayerPosition=$(( $firstPlayerPosition + $randomDieMove ))
		;;
	$SNAKE)
		firstPlayerPosition=$(( $firstPlayerPosition - $randomDieMove ))
		;;

	esac
	 moveCondition $firstPlayerPosition

done
