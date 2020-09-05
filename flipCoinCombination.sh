#!/bin/bash -x

declare -A dictCombinationCount
declare -A dictCombinationPercentage

read -p "Enter the number of times do you want to flip coins: " n

H_count=0
T_count=0

for (( i=0;i<n;i++ ))
do
	coin_flip_result=$(( RANDOM%2 ))
	if [[ $coin_flip_result -eq 0 ]]
	then
		(( H_count++ ))
	else
		(( T_count++ ))
	fi
done

dictCombinationCount[H]=$H_count
dictCombinationCount[T]=$T_count

dictCombinationPercentage[H]=$(( $H_count*100/$n ))
dictCombinationPercentage[T]=$(( $T_count*100/$n ))

HH_count=0
HT_count=0
TH_count=0
TT_count=0

for (( i=0;i<n;i++ ))
do
        coin_flip_result1=$(( RANDOM%2 ))
        coin_flip_result2=$(( RANDOM%2 ))
        if [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 0 ]]
        then
                (( HH_count++ ))
        elif [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 1 ]]
        then
                (( HT_count++ ))
        elif [[ $coin_flip_result1 -eq 1 && $coin_flip_result2 -eq 0 ]]
        then
                (( TH_count++ ))
        else
                (( TT_count++ ))
        fi
done

dictCombinationCount[HH]=$HH_count
dictCombinationCount[HT]=$HT_count
dictCombinationCount[TH]=$TH_count
dictCombinationCount[TT]=$TT_count

dictCombinationPercentage[HH]=$(( $HH_count*100/$n ))
dictCombinationPercentage[HT]=$(( $HT_count*100/$n ))
dictCombinationPercentage[TH]=$(( $TH_count*100/$n ))
dictCombinationPercentage[TT]=$(( $TT_count*100/$n ))

HHH_count=0
HHT_count=0
HTH_count=0
HTT_count=0
THH_count=0
THT_count=0
TTH_count=0
TTT_count=0

for (( i=0;i<n;i++ ))
do
        coin_flip_result1=$(( RANDOM%2 ))
        coin_flip_result2=$(( RANDOM%2 ))
        coin_flip_result3=$(( RANDOM%2 ))
        if [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 0 && $coin_flip_result3 -eq 0 ]]
        then
                (( HHH_count++ ))
        elif [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 0 && $coin_flip_result3 -eq 1 ]]
        then
                (( HHT_count++ ))
        elif [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 1 && $coin_flip_result3 -eq 0 ]]
        then
                (( HTH_count++ ))
        elif [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 1 && $coin_flip_result3 -eq 1 ]]
        then
                (( HTT_count++ ))
        elif [[ $coin_flip_result1 -eq 1 && $coin_flip_result2 -eq 0 && $coin_flip_result3 -eq 0 ]]
        then
                (( THH_count++ ))
        elif [[ $coin_flip_result1 -eq 1 && $coin_flip_result2 -eq 0 && $coin_flip_result3 -eq 1 ]]
        then
                (( THT_count++ ))
        elif [[ $coin_flip_result1 -eq 1 && $coin_flip_result2 -eq 1 && $coin_flip_result3 -eq 0 ]]
        then
                (( TTH_count++ ))
        else
                (( TTT_count++ ))
        fi
done

dictCombinationCount[HHH]=$HHH_count
dictCombinationCount[HHT]=$HHT_count
dictCombinationCount[HTH]=$HTH_count
dictCombinationCount[HTT]=$HTT_count
dictCombinationCount[THH]=$THH_count
dictCombinationCount[THT]=$THT_count
dictCombinationCount[TTH]=$TTH_count
dictCombinationCount[TTT]=$TTT_count

dictCombinationPercentage[HHH]=$(( $HHH_count*100/$n ))
dictCombinationPercentage[HHT]=$(( $HHT_count*100/$n ))
dictCombinationPercentage[HTH]=$(( $HTH_count*100/$n ))
dictCombinationPercentage[HTT]=$(( $HTT_count*100/$n ))
dictCombinationPercentage[THH]=$(( $THH_count*100/$n ))
dictCombinationPercentage[THT]=$(( $THT_count*100/$n ))
dictCombinationPercentage[TTH]=$(( $TTH_count*100/$n ))
dictCombinationPercentage[TTT]=$(( $TTT_count*100/$n ))

echo "Combination " ${!dictCombinationCount[@]}
echo "Count Combination : " ${dictCombinationCount[@]}
echo "Percentage :" ${dictCombinationPercentage[@]}

win_comb_percentage=0
for key in ${!dictCombinationPercentage[@]}
do
	val=${dictCombinationPercentage[$key]}
	if [[ $win_comb_percentage -le $val ]]
	then
		combination=$key
		win_comb_percentage=$val
	fi
done

echo "Winning Combination: $combination"
