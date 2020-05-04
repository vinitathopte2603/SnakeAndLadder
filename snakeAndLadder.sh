#!/bin/bash -x

var="Welcome to snake and ladder game"
echo "$var"

INITIAL_POSITION=0;
WINNING_POSITION=6;
NUMBER_OF_PLAYER=1;
playerPosition=$INITIAL_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2;
diceCounter=0;
turn=0
firstPlayerPosition=$INITIAL_POSITION;
secondPlayerPosition=$INITIAL_POSITION;

declare -A position
declare -A firstPlayerPositionCounter
declare -A secondPlayerPositionCounter
function moveCondition(){

	if [ $1 -le 0 ]
	then
		echo playerPosition=$INITIAL_POSITION;
	elif [ $1 -eq $WINNING_POSITION ]
	then
		echo win
	elif [ $1 -gt $WINNING_POSITION ]
	then
		playerPosition=$(( $1 - $2 ))
	fi
}

function checkingCases(){

 randomDieMove=$((RANDOM%6+1))
        diceCounter=$(( $diceCounter + 1 ))
        Option=$((RANDOM%3))
        case $Option in
        $NOPLAY)
                playerPosition=$playerPosition
		turn=$(( $turn + 1 ))
                ;;

        $LADDER)
                playerPosition=$(( $playerPosition + $randomDieMove ))
		turn=$(( $turn + 1 ))
                ;;
        $SNAKE)
                playerPosition=$(( $playerPosition - $randomDieMove ))
		turn=$(( $turn +1 ))
                ;;

        esac
         moveCondition $playerPosition $randomDieMove
         position[$diceCounter]=$playerPosition

}


while [ $firstPlayerPosition -lt $WINNING_POSITION ] && [ $secondPlayerPosition -lt $WINNING_POSITION ]
do
	if [ $(($turn%2)) -eq 0 ]
	then
		playerPosition=$firstPlayerPosition
		checkingCases $playerPosition $firstPlayerPositionCounter
		firstPlayerPositionCounter[$diceCounter]=$playerPosition
		firstPlayerPositionCounter=$playerPosition
		if [ $firstPlayerPositionCounter -eq $WINNING_POSITION ]
		then
			echo "Player one won"
			break
		fi
	else 
		playerPosition=$secondPlayerPosition
		checkingCases $playerPosition $secondPlayerPositionCounter
		secondPlayerPositionCounter[$diceCounter]=$playerPosition
		secondPlayerPositionCounter=$playerPosition
		if [ $secondPlayerPositionCounter -eq $WINNING_POSITION ]
		then
			echo "player two won"
			break
		fi
	fi	
done
