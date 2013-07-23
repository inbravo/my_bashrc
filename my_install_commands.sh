#!/usr/bin/env bash

uninstall_open_java(){
	# Removing Open JDK from the system.
	sudo apt-get purge openjdk*
	sudo apt-get update
}

installing_oracle_7_java(){
	# Installing Oracle Java
	cd ~/Downloads
	wget https://github.com/flexiondotorg/oab-java6/raw/0.2.8/oab-java.sh -O oab-java.sh
	chmod 777 oab-java.sh
	sudo ./oab-java.sh -7
	sudo apt-get update
	sudo apt-get install oracle-java7-jdk oracle-java7-fonts oracle-java7-source ssh
}

intall_oracle_7_java(){
	sudo apt-get purge openjdk*
	#Now you can install Java 7 by adding the following repository:
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java7-installer
}

installing_required_components(){
	# Components for Development
	sudo apt-get update
	sudo apt-get install maven
	sudo apt-get install tree
	sudo apt-get install vim
	sudo apt-get install geany
	#sudo apt-get install wine
	sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack cabextract file-roller
	#sudo apt-get install libxine1-ffmpeg gxine mencoder totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 
	sudo apt-get install curl
	sudo apt-get install telnetd
	sudo apt-get install subversion
	sudo apt-get install mysql-server
	sudo apt-get purge openjdk*
	
}

installing_python_components(){
	# Installing Python and required components
	sudo apt-get install python
	sudo apt-get install python-date
	sudo apt-get install python-dateutil
	sudo apt-get install python-genfromtxt
	sudo apt-get install genfromtxt
	sudo apt-get install numpy
	sudo apt-get install python-numpy
}

installing_linux_headers(){
	# Installing Linux header - used for VMWare linux
	sudo apt-get update
	sudo apt-get install linux-headers-$(uname -r)
}

downloading_files(){
	cd ~/Downloads
	wget -c http://mirrors.sonic.net/apache/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz
	wget -c http://download.jetbrains.com/idea/ideaIU-12.1.4.tar.gz
	wget -c http://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/1.7.7/xampp-linux-1.7.7.tar.gz
}

transfer_files_opt(){
	sudo tar xvzf apache-tomcat-7.0.42.tar.gz -C /opt
	sudo tar xvzf ideaIU-12.1.4.tar.gz -C /opt
	#sudo tar xvzf xampp-linux-1.7.7.tar.gz -C /opt
}

configuring_downloads(){
	cd /opt/
	sudo chown $USER:$USER -R apache-tomcat-7.0.42
	sudo chown $USER:$USER -R idea*
	sudo /opt/lampp/lampp start		
}

installing_cloudera_precise(){
	# Installing Clodera Hadoop.
	cd ~/Downloads/
	wget http://archive.cloudera.com/cdh4/one-click-install/precise/amd64/cdh4-repository_1.0_all.deb
	sudo dpkg -i cdh4-repository_1.0_all.deb
	sudo apt-get update
	sudo apt-get install zookeeper-server
	#sudo apt-get install zookeeper=3.4.5+19-1.cdh4.3.0.p0.14~precise-cdh4.3.0 hadoop-0.20-conf-pseudo
	sudo apt-get install zookeeper=3.4.5+19-1.cdh4.3.0.p0.14~precise-cdh4.3.0 hadoop-0.20-conf-pseudo
}

config_cloudera_hadoop(){
	# Step 1: Format the NameNode.
	sudo -u hdfs hdfs namenode -format

	# Step 2: Start HDFS
	for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done

	# Step 3: Create the /tmp Directory
	sudo -u hdfs hadoop fs -mkdir /tmp 
	sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
	 
	# Step 4: Create the MapReduce system directories: 
	sudo -u hdfs hadoop fs -mkdir -p /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
	sudo -u hdfs hadoop fs -chmod 1777 /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
	sudo -u hdfs hadoop fs -chown -R mapred /var/lib/hadoop-hdfs/cache/mapred

	# Step 5: Verify the HDFS File Structure
	sudo -u hdfs hadoop fs -ls -R /

	# Step 6: Start MapReduce
	for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done

	 
	# Step 7: Create User Directories
	# Create a home directory for each MapReduce user. It is best to do this on the NameNode; for example:

	sudo -u hdfs hadoop fs -mkdir /user/$USER 
	sudo -u hdfs hadoop fs -chown $USER /user/$USER

	# Running some Test Now

	# Make a directory in HDFS called input and copy some XML files into it by running the following commands:
	hadoop fs -mkdir input
	hadoop fs -put /etc/hadoop/conf/*.xml input
	hadoop fs -ls input

	#Run an example Hadoop job to grep with a regular expression in your input data.
	/usr/bin/hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar grep input output 'dfs[a-z.]+'

	# List the output files.
	hadoop fs -ls

	# Read the results in the output file; for example:
	hadoop fs -cat output/part-00000 | head
}


echo -e "${BOLD}${RED_F} Welcome to Ubuntu Desktop Setup  ${NORM}"
echo


echo -n "Would you like to remove Open Java ? (y/n) "
read SET_OPENJAVA_UNINSTALL
if [ "${SET_OPENJAVA_UNINSTALL}" == "y" ]; then
	uninstall_open_java
else
	 echo -e "Open Java Not UnInstalled"
fi

echo -n "Would you like to install Oracle Java 7? (y/n) "
read SET_JAVA_INSTALL
if [ "${SET_JAVA_INSTALL}" == "y" ]; then
	installing_oracle_7_java
else
	 echo -e "Java Not Installed"

fi

echo -n "Would you like to general Components? (y/n) "
read SET_GEN_INSTALL
if [ "${SET_GEN_INSTALL}" == "y" ]; then
	installing_required_components
	installing_python_components
	installing_linux_headers
else
	 echo -e "GEN Not Installed"

fi


echo -n "Would you like to install dev Components? (y/n) "
read SET_DEV_INSTALL
if [ "${SET_DEV_INSTALL}" == "y" ]; then
	downloading_files
	transfer_files_opt
	configuring_downloads
else
	 echo -e "DEV Not Installed"

fi

echo -n "Would you like to install Cludera for Precise Single Node Cluster? (y/n) "
read SET_CLUDERA_PSEUDO_INSTALL
if [ "${SET_CLUDERA_PSEUDO_INSTALL}" == "y" ]; then
	installing_cloudera_precise
else
	 echo -e "CLUDERA_PSEUDO Not Installed"

fi


echo -n "Would you like to Configure Cludera for Precise Single Node Cluster? (y/n) "
read SET_CLUDERA_PSEUDO_CONFIG
if [ "${SET_CLUDERA_PSEUDO_CONFIG}" == "y" ]; then
	config_cloudera_hadoop
else
	 echo -e "CLUDERA_CONFIG Not Complete"

fi



