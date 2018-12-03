#!/bin/bash
PID=$(ps aux|grep "toutiao_list"| grep -v grep | awk '{printf $2}')
if [ $PID > 0 ]; then
	pt=/home/super/log/result.log
	a=`stat -c %Y $pt`
	b=`date +%s`  

	echo $a
	echo $b
	echo $[$b - $a]
	if [ $[ $b - $a ] -gt 900 ];  
	then

		while [[ 1 ]]; do
			PID=$(ps aux|grep "********"| grep -v grep | awk '{printf $2}')
			if [ $PID > 0 ]; then
			    echo "process id:$PID"
			    kill $PID
			else
				break
			fi
		done
	else
    exit
	fi
fi

cd /home/super/crawler/
nohup node --max_old_space_size=30000 toutiao_list.js > ../log/result.log 2>&1 &
