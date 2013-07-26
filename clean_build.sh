svn update;
mvn clean install -DskipTests;
/opt/lamp/bin/mysql -uroot -proot < clean_setup_db.sql;
cd core/core-api;
mvn install;
