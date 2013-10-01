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

echo -e "${RED_F}Are you sure you want to create tables on Hbase (yes/no)${NORM}"
read UPDATE_FILE

if [ $UPDATE_FILE == "yes" ]; then
echo "create 'LSP_DETAIL', 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'NODE_DETAIL', 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'TRUNK_DETAIL', 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'RBS_DETAIL' , 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'RNC_DETAIL' , 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'DATE_TABLE' , 'DASHBOARD', 'LOOKUP', 'OTHERS', 'PERFORMANCE'
create 'AREA_TABLE' , 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'VRF_DETAIL' , 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'REPORT_TABLE' , 'REPORT_CONFIG'
create 'VRF_REPORT' , 'REPORT'
create 'PWE_DETAIL' , 'CONFIG', 'DETAIL', 'PERFORMANCE'
create 'RBS_RNC_PATH' , 'PATH'" | hbase shell 

fi
if [ $UPDATE_FILE == "y" ]; then
  echo -e "${MAGENTA_F}Please type 'yes' if you are sure to delete HBase Tables${NORM}"
fi





