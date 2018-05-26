#!/bin/sh

. scripts/colors.sh

printf "%s$CYAN%s-------------------------------------------------------------------------------\n"
printf "%s$CYAN%s \u2713 ";
printf "%s$CYAN%sRunning maven install archetypes\n"
printf "%s$CYAN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v

for d in */ ; do
	if [[ $d == *"archetype-"* ]]; then
		
		printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
		printf "%s$GREEN%s \u2713 ";
		printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Runing mvn install archetype "$d
		printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
		cd $d
		mvn clean install
		printf "%s$YELLOW%s-------------------------------------------------------------------------------\n"
		printf "%s$YELLOW%s \u2713 ";
		printf "%s$YELLOW%sUpdating maven catalog\n"
		printf "%s$YELLOW%s-------------------------------------------------------------------------------%s$RESET%s\n"
		mvn install archetype:update-local-catalog
		cd ..
	fi
done


printf "%s$CYAN%s-------------------------------------------------------------------------------\n"
printf "%s$CYAN%s \u2713 ";
printf "%s$CYAN%sRunning crawl to build catalog\n"
printf "%s$CYAN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn archetype:crawl
