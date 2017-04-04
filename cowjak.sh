#!/bin/bash
if [ "$1" = "install" ]
then
	echo "Dependancies to be installed:"
	echo "cowsay - Tony Monroe"
	echo "fortune - A great many people, without leaving attributions"
	echo "recode - Francois Pinard"
	echo "jshon - Kyle Keen"
	echo "rig - Ian Turner"
	echo "w3m - "
	echo "Would you like to continue with installation? [y/n]" 
	read ack
	if [ "$ack" = "y" ]
	then
		sudo apt-get install cowsay fortune recode jshon rig w3m
		echo "Hey there, whats up! Its me Cowjak. If you want to know what I can jabber on about, just run './cowjak.sh help'" | cowsay
	elif [ "$ack" = "n" ]
	then
		echo "Ok, installation halting - Its probably for the best, Cowjak is incredibly irritating anyway. (But you didn't hear me say that)"
	else
		echo "Sorry, I didnt recognise that answer, please run the install script again."
	fi
elif [ "$1" = "norris" ]
then
	wget "http://api.icndb.com/jokes/random" -qO- | jshon -e value -e joke -u | recode html | cowsay
elif [ "$1" = "fortune" ]
then
	fortune | cowsay
elif [ "$1" = "insult" ]
then
	w3m http://www.pangloss.com/seidel/Shaker/index.html? | grep Th | cowsay
elif [ "$1" = "add" ]
then
	echo "Whats the first number?" | cowsay
	read int1
	echo  "Thanks, whats the second number?" | cowsay
	read int2
	echo  "Chrunching grass...I MEAN NUMBERS" | cowsay
	sleep 2
	echo  "...mmmmmm, grass..." | cowthink
	sleep 3
	ans=`expr $int1 + $int2`
	echo  The answer is: $ans | cowsay
elif [ "$1" = "sub" ]
then
        echo "Whats the first number?" | cowsay
        read int1
        echo "Thanks, whats the second number?" | cowsay
        read int2
        echo "Chrunching grass...I MEAN NUMBERS" | cowsay
        sleep 2
        echo "...mmmmmm, grass..." | cowthink
        sleep 3
        ans=`expr $int1 - $int2`
        echo The answer is: $ans | cowsay
elif [ "$1" = "div" ]
then
        echo "Whats the first number?" | cowsay
        read int1
        echo "Thanks, whats the second number?" | cowsay
        read int2
        echo "Chrunching grass...I MEAN NUMBERS" | cowsay
        sleep 2
        echo "...mmmmmm, grass..." | cowthink
        sleep 3
	if [ "$int1" = 0 ]
	then
		echo "Wait...DIVIDE BY ZERO!?! YOU'VE KILLED US ALL!!" | cowsay
	elif [ "$int2" = 0 ]
	then
		echo "Wait...DIVIDE BY ZERO!?! YOU'VE KILLED US ALL!!" | cowsay
	else
        	ans=`expr $int1 / $int2`
        	echo The answer is: $ans | cowsay
	fi
elif [ "$1" = "mul" ]
then
        echo "Whats the first number?" | cowsay
        read int1
        echo "Thanks, whats the second number?" | cowsay
        read int2
        echo "Chrunching grass...I MEAN NUMBERS" | cowsay
        sleep 2
        echo "...mmmmmm, grass..." | cowthink
        sleep 3
        ans=`expr $int1 \* $int2`
        echo The answer is: $ans | cowsay
elif [ "$1" = "id" ]
then
	rig | cowsay
elif [ "$1" = "help" ]
then
	echo "Ask Cowjak to say something by typing an arguement at the end of the script call, for example $ ./cowjak insult."
	echo " "
	echo "Here is a full list of commands, ones in CAPS are not commands, they are sub headings:"
	echo "install - Install the dependancies Cowjak needs to work, you must have these installed before you can talk to Cowjak"
	echo " norris - Cowjak will say a Chuck Norris joke. Courtesey of http://api.icndb.com/jokes/random"
	echo "fortune - Cowjak will give you your fortune, don't expect your fortunes to be good though"
	echo "     id - Let Cowjak create your undercover identity, useful in hostile environments"
	echo " insult - Cowjak will insult thou in a Shakesperian manner. Courtesey of http://www.pangloss.com/seidel/Shaker/index.html?"
	echo "   help - Takes you to the help page, what you're looking at right now"
	echo " "
	echo "MATHEMEATICS:"
	echo "	add - Cowjak will add one integer to another"
	echo "	sub - Cowjak will subtract one integer from another"
	echo "	mul - Cowjak will multiply two integers together"
	echo "	div - Cowjak will divide one integer with another"
else
	echo "Please run cowjak.sh with an arguement that Cowjak recognises."
	echo "To see a list of commands Cowjak recognises, run ./cowjak help"
	echo " "
	echo "If this is your first time using Cowjak, or you are experiencing errors, run ./cowjak install"
fi