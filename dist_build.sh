svn update
mvn clean install -DskipTests
/opt/lampp/bin/mysql -uroot -proot < clean_setup_db.sql
cd core/core-api
mvn install

