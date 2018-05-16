
echo "-------------------------------------------------------------------------------"
echo "Runing java -jar projects"
echo "-------------------------------------------------------------------------------"



export JAVA_HOME='C:/Program Files/Java/jdk1.8.0_40'
for d in * ; do
		echo "-------------------------------------------------------------------------------"
		echo "Runing service "$d
		echo "-------------------------------------------------------------------------------"
		cd $d
		start "$d" "%SYSTEMDRIVE%\Program Files (x86)\Git\bin\sh.exe" --login -i -l -c "sh -c 'java -jar target/$d-0.0.1-SNAPSHOT.jar; exec sh'"
		cd ..
		sleep 10
done