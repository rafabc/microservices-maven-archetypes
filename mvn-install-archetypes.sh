echo "Runing mvn install archetypes"
mvn -v

for d in */ ; do
	if [[ $d = *"archetype"* ]]; then
		echo "Runing mvn install for "$d
		cd $d
		mvn clean install
		cd ..
	fi
done
mvn install archetype:update-local-catalog
mvn archetype:crawl
