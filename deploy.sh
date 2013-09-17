#
# Text Formating
#

BOLD="\033[1m";
NORM="\033[0m";

BLACK_F="\033[30m"; BLACK_B="\033[40m"
RED_F="\033[31m"; RED_B="\033[41m"
GREEN_F="\033[32m"; GREEN_B="\033[42m"
YELLOW_F="\033[33m"; YELLOW_B="\033[43m"
BLUE_F="\033[34m"; BLUE_B="\033[44m"
MAGENTA_F="\033[35m"; MAGENTA_B="\033[45m"
CYAN_F="\033[36m"; CYAN_B="\033[46m"
WHITE_F="\033[37m"; WHITE_B="\033[47m"


sudo /data/apache-tomcat-7.0.42/bin/shutdown.sh
echo -e "${BOLD}${RED_F}Waiting for Server to shutdown"
sleep 2
tail -10 /data/apache-tomcat-7.0.42/logs/catalina.out
sleep 5

echo -e "${BOLD}${CYAN_F}Starting backup procedure for 'LI' database > '/data/zahmed/backup/li_$(date +'%Y%m%d%H%M').sql'${NORM}"
mysqldump -uli -pli li > /data/zahmed/backup/li_"$(date +'%Y%m%d%H%M')".sql
tar czf /data/zahmed/backup/li_"$(date +'%Y%m%d%H%M')".sql.tgz -P /data/zahmed/backup/li_"$(date +'%Y%m%d%H%M')".sql
rm  /data/zahmed/backup/li_"$(date +'%Y%m%d%H%M')".sql
sleep 1

echo -e "${BOLD}${CYAN_F}Starting backup procedure li jar files > '/data/zahmed/backup/li_jar_$(date +'%Y%m%d%H%M').tgz'${NORM}"
tar czf /data/zahmed/backup/li_jar_"$(date +'%Y%m%d%H%M')".tgz -P /var/local/libjars/li*
sleep 1

echo -e "${BOLD}${CYAN_F}Starting backup procedure li sample_date files > '/data/zahmed/backup/li_sample_data_$(date +'%Y%m%d%H%M').tgz'${NORM}"
tar czf /data/zahmed/backup/li_sample_data_"$(date +'%Y%m%d%H%M')".tgz -P /var/local/li
sleep 1 
echo -e "${BOLD}${CYAN_F}Completed backup procedure li sample_date files.${NORM}"

echo -e "${BOLD}${CYAN_F}Backing-up li.war to '/data/zahmed/backup/li_$(date +'%Y%m%d%H%M').war'${NORM}"
cp -rf /data/apache-tomcat-7.0.42/webapps/li.war /data/zahmed/backup/li_"$(date +'%Y%m%d%H%M')".war
sleep 1

echo -e "${BOLD}${YELLOW_F}Removing old war file${NORM}"
sudo rm -rf /data/apache-tomcat-7.0.42/webapps/li.war /data/apache-tomcat-7.0.42/webapps/li

echo -e "${BOLD}${YELLOW_F}Copying new war file${NORM}"
sudo cp /data/zahmed/code/tellabs_dev_branch/li-extension/web/target/li-extension.war /data/apache-tomcat-7.0.42/webapps/li.war
echo -e "${BOLD}${RED_F}Copy Complete.${NORM}"

echo -e "${BOLD}${YELLOW_F}Copying New li jar to /var/local/libjars file${NORM}"
cd /data/zahmed/code/tellabs_dev_branch/li-extension/web/target/li-extension/WEB-INF/lib/
sudo cp li-core-apf-1.0.jar li-core-api-1.0.jar li-data-collector-api-1.0.jar li-data-dictionary-api-1.0.jar li-data-pipeline-model-1.0.jar li-extension-tellabs-1.0.jar li-platform-common-api-1.0.jar li-platform-model-1.0.jar li-platform-persistence-1.0.jar li-platform-runtime-1.0.jar /var/local/libjars/
cd -
echo -e "${BOLD}${RED_F}Jar copy complete.${NORM}"


