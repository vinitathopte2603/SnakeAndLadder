#!/bin/bash -x

var="Welcome to snake and ladder game"
echo "$var"

INITIAL_POSITION=0;
NUMBEROFPLAYER=1;

firstPlayerPosition=$INITIAL_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2; 
randomDieMove=$((RANDOM%6+1))
Option=$((RANDOM%3))

	case $Option in
	$NOPLAY)
		firstPlayerPosition=$firstPlayerPosition;;
	$LADDER)
		firstPlayerPosition=$(( $firstPlayerPosition + $randomDieMove ));;
	$SNAKE)
		firstPlayerPosition=$(( $firstPlayerPosition - $randomDieMove ));;
	esac
