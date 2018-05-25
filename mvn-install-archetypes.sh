
RED="\e[0;31m"
GREEN="\e[0;32m"
RESET="\e[0m"

printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
printf "%s$GREEN%s \u2713 ";
printf "%s$GREEN%sRunning maven install archetypes\n"
printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v

for d in */ ; do
	if [[ $d == *"archetype"* ]]; then
		
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		printf "%s$GREEN%s \u2713 ";
		printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Runing mvn install archetype "$d
		printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
		cd $d
		mvn clean install
		cd ..
	fi
done
mvn install archetype:update-local-catalog
mvn archetype:crawl
