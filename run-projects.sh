
echo "-------------------------------------------------------------------------------"
echo "Runing java -jar projects"
echo "-------------------------------------------------------------------------------"



export JAVA_HOME='C:/Program Files/Java/jdk1.8.0_40'
for d in * ; do
		cd $d
		echo "-------------------------------------------------------------------------------"
		echo "Runing service "$PWD/target/$d-0.0.1-SNAPSHOT.jar
		echo "-------------------------------------------------------------------------------"
		
		start "" "%SYSTEMDRIVE%\Program Files\Git\bin\sh.exe" --login -i -l -c "sh -c 'java -jar $PWD/target/$d-0.0.1-SNAPSHOT.jar; exec sh'"
		cd ..
		
		sleep 10
done