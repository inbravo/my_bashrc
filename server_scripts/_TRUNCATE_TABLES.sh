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

if [ $UPDATE_FILE == "yes" ]; then
  echo "
  truncate 'AREA_TABLE'
  truncate 'DATE_TABLE'
  truncate 'LSP_DETAIL'
  truncate 'NODE_DETAIL'
  truncate 'PWE_DETAIL'
  truncate 'RBS_DETAIL'
  truncate 'RBS_RNC_PATH'
  truncate 'REPORT_TABLE'
  truncate 'RNC_DETAIL'
  truncate 'TRUNK_DETAIL'
  truncate 'VRF_DETAIL'" | hbase shell
fi
if [ $UPDATE_FILE == "y" ]; then
  echo "${MAGENTA_F}Please type 'yes' if you are sure to delete HBase Tables${NORM}"
fi
