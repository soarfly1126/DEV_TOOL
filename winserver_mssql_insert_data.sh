#!/bin/sh
interval=60
#datestr=`date "+%F %T"`
filename="./file.txt"
#dbuser="root"
#dbpass="password"
dbname="VSA-TEST-WINSER"
table="dbo.test1"
table_col="DATE"
sqlcmd_path="/drives/c/Program\ Files/Microsoft\ SQL\ Server/Client\ SDK/ODBC/130/Tools/Binn"

while true;do
#echo update string to file
#echo $datastr >> $filename
echo update database record
${sqlcmd_path}/SQLCMD.EXE -S ${dbname} <<EOF
USE VSA_TEST;
GO
INSERT INTO ${table} (${table_col}) VALUES (CURRENT_TIMESTAMP);
GO
EOF

echo wait $interval sec
sleep $interval
done
