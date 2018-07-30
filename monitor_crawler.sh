#!/bin/bash
pt=
jpt=
a=`stat -c %Y $pt`
b=`date +%s`  

echo $a
echo $b
echo $[$b - $a]

if [ $[ $b - $a ] -gt 1 ];  
then

	while [[ 1 ]]; do
		PID=$(ps aux|grep "restanrant_google.js"| grep -v grep | awk '{printf $2}')
		if [ $PID > 0 ]; then
		    echo "process id:$PID"
		    kill $PID
		else
			break
		fi
	done

laststart=`grep "new start" $pt | tail -1`
echo $((${laststart:10} + 1))

oldid=`sed -n '18p' $jpt`
echo ${oldid:17}

sed -i "s/${oldid:17}/$((${laststart:10} + 1));/g" $jpt

cd 
rm log/1.log
nohup node --max_old_space_size=30000 restanrant_google.js > log/1.log 2>&1 &

fi