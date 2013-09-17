echo -e "${BOLD}${RED_F} Updating Hbase Configuration Files: ${NORM}"
echo -e "${RED_F}Would like to update hbase-site.xml files (y/n)${NORM}"
read UPDATE_FILE

if [ $UPDATE_FILE == "y" ]; then

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
