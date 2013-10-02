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

CURRENTTIME="$(date +'%Y%m%d%H%M')"

echo -e "${BOLD}${RED_F}Backing up Hbase Tables .... ${NORM}"
hbase org.apache.hadoop.hbase.mapreduce.Export RBS_DETAIL /data/ti-dev/zahmed/tables/backup/RBS_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export NODE_DETAIL /data/ti-dev/zahmed/tables/backup/NODE_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export LSP_DETAIL /data/ti-dev/zahmed/tables/backup/LSP_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export PWE_DETAIL /data/ti-dev/zahmed/tables/backup/PWE_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export RBS_RNC_PATH /data/ti-dev/zahmed/tables/backup/RBS_RNC_PATH_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export REPORT_TABLE /data/ti-dev/zahmed/tables/backup/REPORT_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export RNC_DETAIL /data/ti-dev/zahmed/tables/backup/RNC_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export TRUNK_DETAIL /data/ti-dev/zahmed/tables/backup/TRUNK_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export VRF_DETAIL /data/ti-dev/zahmed/tables/backup/VRF_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export AREA_TABLE /data/ti-dev/zahmed/tables/backup/AREA_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export DATE_TABLE /data/ti-dev/zahmed/tables/backup/DATE_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export VRF_REPORT /data/ti-dev/zahmed/tables/backup/VRF_REPORT_$CURRENTTIME

echo -e "${BOLD}${RED_F}Backup Complete ... ${NORM}"
echo -e "${YELLOW_F}"
hadoop fs -ls /data/ti-dev/zahmed/tables/backup/
echo -e "${NORM}"
echo -e "${BOLD}${RED_F}Backup Location on HDFS : hadoop fs -ls /data/ti-dev/zahmed/tables/backup/ ${NORM}"

