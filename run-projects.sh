#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh

msg_task "Running java -jar samples"

cd samples

delay=40



if [ -z "$1" ]; then #when there isnt parameters (without archetype input)

	#IMPORTANT
	#this if (no else) script only run projects on windows thought git bash

	for d in * ; do
		
		if [[ $d != *"node"* ]]; then #dont run project node y spring micros
			cd $d

			printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
			printf "%s$GREEN%s \u2713 ";
			printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Launching service $d-0.0.1-SNAPSHOT.jar"
			
			start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'java -jar $PWD/target/$d-0.0.1-SNAPSHOT.jar'"
			sleep $delay
			printf "%s$GREEN%s \u2713 READY\n";
			printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
			cd ..
		fi

		if [[ $d == *"node"* ]]; then #dont run project node and spring micros
			cd $d

			printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
			printf "%s$GREEN%s \u2713 ";
			printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Launching node microservice"
			
			start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'node $PWD/src/index'"
			sleep $delay
			printf "%s$GREEN%s \u2713 READY\n";
			printf "%s$GREEN%s-------------------------------------------------------------------------------\n"

			cd ..
		fi
		delay=$(( $delay-5 ))
	done




else 

	nohup java -jar $1/target/$1-0.0.1-SNAPSHOT.jar &



fi




