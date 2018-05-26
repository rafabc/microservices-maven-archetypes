#!/bin/sh

. scripts/colors.sh
. scripts/parameters.sh

printf "%s$RED%s-------------------------------------------------------------------------------\n"
printf "%s$RED%sRunning java -jar projects\n"
printf "%s$RED%s-------------------------------------------------------------------------------\n\n"


cd projects


for d in * ; do
	
	if [[ $d != *"node"* ]]; then #dont run project node y spring micros
		cd $d

		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		printf "%s$GREEN%s \u2713 ";
		printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Launching service $d-0.0.1-SNAPSHOT.jar"
		
		start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'java -jar $PWD/target/$d-0.0.1-SNAPSHOT.jar'"
		sleep 40
		printf "%s$GREEN%s \u2713 READY\n";
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		cd ..
	fi

	if [[ $d == *"node"* ]]; then #dont run project node y spring micros
		cd $d

		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		printf "%s$GREEN%s \u2713 ";
		printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Launching node microservice"
		
		start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'node $PWD/src/index'"
		sleep 40
		printf "%s$GREEN%s \u2713 READY\n";
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"

		cd ..
	fi


done


