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
PREFIX="DMO_TELLABS_"
#PREFIX=""

echo -e "${BOLD}${RED_F}Backing up Hbase Tables .... ${NORM}"
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"RBS_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"RBS_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"NODE_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"NODE_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"LSP_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"LSP_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"PWE_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"PWE_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"ENTPWE_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"ENTPWE_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"RBS_RNC_PATH /data/ti-dev/zahmed/tables/backup/"$PREFIX"RBS_RNC_PATH_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"REPORT_TABLE /data/ti-dev/zahmed/tables/backup/"$PREFIX"REPORT_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"RNC_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"RNC_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"TRUNK_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"TRUNK_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"VRF_DETAIL /data/ti-dev/zahmed/tables/backup/"$PREFIX"VRF_DETAIL_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"AREA_TABLE /data/ti-dev/zahmed/tables/backup/"$PREFIX"AREA_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"DATE_TABLE /data/ti-dev/zahmed/tables/backup/"$PREFIX"DATE_TABLE_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"VRF_REPORT /data/ti-dev/zahmed/tables/backup/"$PREFIX"VRF_REPORT_$CURRENTTIME
hbase org.apache.hadoop.hbase.mapreduce.Export "$PREFIX"TRUNK_REPORT /data/ti-dev/zahmed/tables/backup/"$PREFIX"TRUNK_REPORT_$CURRENTTIME

echo -e "${BOLD}${RED_F}Backup Complete ... ${NORM}"
echo -e "${YELLOW_F}"
hadoop fs -ls /data/ti-dev/zahmed/tables/backup/"$PREFIX"*$CURRENTTIME*
echo -e "${NORM}"
echo -e "${BOLD}${RED_F}Backup Location on HDFS : hadoop fs -ls /data/ti-dev/zahmed/tables/backup/"$PREFIX" ${NORM}"

