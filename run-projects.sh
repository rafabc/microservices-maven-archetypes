
RED="\e[0;31m"
GREEN="\e[0;32m"
RESET="\e[0m"

printf "%s$RED%s-------------------------------------------------------------------------------\n"
printf "%s$RED%sRunning java -jar projects\n"
printf "%s$RED%s-------------------------------------------------------------------------------\n\n"




for d in * ; do
		cd $d
		
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		printf "%s$GREEN%s \u2713 ";
		printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Launching service $d-0.0.1-SNAPSHOT.jar"
		
		start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'java -jar $PWD/target/$d-0.0.1-SNAPSHOT.jar'"
		sleep 40
		printf "%s$GREEN%s \u2713 READY\n";
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"

		cd ..
done


