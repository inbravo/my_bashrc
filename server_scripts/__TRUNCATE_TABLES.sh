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

echo -e "${RED_F}Are you sure you want to truncate tables on Hbase (yes/no)${NORM}"
read UPDATE_FILE

echo -e "${RED_F}Please enter the Table PREFIX ex: DMO_TELLABS_${NORM}"
read PREFIX



if [ $UPDATE_FILE == "yes" ]; then

echo "
truncate '"$PREFIX"RBS_DETAIL'
truncate '"$PREFIX"NODE_DETAIL'
truncate '"$PREFIX"LSP_DETAIL'
truncate '"$PREFIX"PWE_DETAIL'
truncate '"$PREFIX"ENTPWE_DETAIL'
truncate '"$PREFIX"RBS_RNC_PATH'
truncate '"$PREFIX"REPORT_TABLE'
truncate '"$PREFIX"RNC_DETAIL'
truncate '"$PREFIX"TRUNK_DETAIL'
truncate '"$PREFIX"VRF_DETAIL'
truncate '"$PREFIX"AREA_TABLE'
truncate '"$PREFIX"DATE_TABLE'
truncate '"$PREFIX"VRF_REPORT'
truncate '"$PREFIX"TRUNK_REPORT'" | hbase shell

fi
if [ $UPDATE_FILE == "y" ]; then
  echo -e "${MAGENTA_F}Please type 'yes' if you are sure to delete HBase Tables${NORM}"
fi
