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


echo -e "${RED_F}Enter the Date Expression for the Input File 'yyyymmddHHMM' ${NORM}"
read DATE_INFO

echo -e "${RED_F}Enter Base PATH in HDFS ${NORM}"
read PATH_IN_HDFS

#if [ $UPDATE_FILE != "" ] && [ $PATH_IN_HDFS != "" ]; then

hbase org.apache.hadoop.hbase.mapreduce.Import RBS_DETAIL $PATH_IN_HDFS/RBS_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import NODE_DETAIL $PATH_IN_HDFS/NODE_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import LSP_DETAIL $PATH_IN_HDFS/LSP_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import PWE_DETAIL $PATH_IN_HDFS/PWE_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import RBS_RNC_PATH $PATH_IN_HDFS/RBS_RNC_PATH_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import REPORT_TABLE $PATH_IN_HDFS/REPORT_TABLE_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import RNC_DETAIL $PATH_IN_HDFS/RNC_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import TRUNK_DETAIL $PATH_IN_HDFS/TRUNK_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import VRF_DETAIL $PATH_IN_HDFS/VRF_DETAIL_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import AREA_TABLE $PATH_IN_HDFS/AREA_TABLE_$DATE_INFO
hbase org.apache.hadoop.hbase.mapreduce.Import DATE_TABLE $PATH_IN_HDFS/DATE_TABLE_$DATE_INFO
echo -e "${RED_F}IMPORT COMPLETE !!! ${NORM}"


#fi
if [ $UPDATE_FILE == "" ]; then
  echo -e "${MAGENTA_F}Please type 'yyyymmddHHMM' for the Input File. Ex: hadoop fs -ls /data/ti-dev/zahmed/tables/backup/* ${NORM}"
fi
