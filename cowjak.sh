#Created by: Jak Edwards: https://github.com/SirFlukealot/
#This is an interactive shell script that utlises the cowsay shell feature developed by Tony Monroe
#To install the dependancies, you will first have to change the permissions of the file to allow it to use
#sudo apt-get install on your machine. Once that is done, just run ./cowjak install to run the installation script.
#After that, enjoy the fun that cowjak brings to your terminal, enjoy :)

#!/bin/bash
if [ "$1" = "install" ]
then
	echo "Dependancies to be installed:"
	echo "cowsay - Tony Monroe"
	echo "fortune - A great many people, without leaving attributions"
	echo "recode - Francois Pinard"
	echo "jshon - Kyle Keen"
	echo "rig - Ian Turner"
	echo "w3m - Akinori ITO"
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
elif [ "$1" = "base64" ]
then
	echo "Encode or decode base64? [e/d] " | cowsay
	read mode
	if [ "$mode" = "e" ]
		then echo "Ok, what would you like me to encode?" | cowsay
		read inp
		echo "EnCOWding... see what I did there" | cowsay
                sleep 3
                echo $inp | openssl base64 -e | cowsay
	elif [ "$mode" = "d" ]
		then echo "Ok, what would you like me to decode?" | cowsay
		read inp
		echo "DeCOWding... see what I did there" | cowsay
                sleep 3
                echo $inp | base64 --decode | cowsay
	else echo "Sorry, I didnt quite hear you. Please choose encode [e], or decode [d]." | cowsay
	fi
elif [ "$1" = "hex" ]
then
	echo "Encode or decode hexadecimal? [e/d] " | cowsay
	read mode
	if [ "$mode" = "e" ]
		then echo "Sure, what is it that you need encoding?" | cowsay
		read inp
		echo "EnCOWding... Bad pun, I know" | cowsay
		sleep 3
		echo -n $inp | od -A n -t x1 | cowsay
	elif [ "$mode" = "d" ]
		then echo "Sure, what is it that you need decoding? (So I can understand properly, please lead with a space and separate the bits by spaces too: i.e. ' 63 6f 77 6a 61 6b')" | cowsay
		read inp
		echo "DeCOWding... Bad pun, I know" | cowsay
		sleep 3
		echo -n $inp | xxd -r -p | cowsay
	else echo "I'm not sure I understand, please try again by typing 'e' for encode, and 'd' for decode."
	fi
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
	echo "MATHEMATICS:"
	echo "	add - Cowjak will add one integer to another"
	echo "	sub - Cowjak will subtract one integer from another"
	echo "	mul - Cowjak will multiply two integers together"
	echo "	div - Cowjak will divide one integer with another"
	echo " "
	echo "ENCRYPTION/DECRYPTION:"
	echo "	base64 - Cowjak will convert a string into base64, and vice versa"
	echo "	   hex - Cowjak will convert a string into hexadecimal, and vice versa"
else
	echo "Please run cowjak.sh with an arguement that Cowjak recognises."
	echo "To see a list of commands Cowjak recognises, run ./cowjak help"
	echo " "
	echo "If this is your first time using Cowjak, or you are experiencing errors, run ./cowjak install"
fi
