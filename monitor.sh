top -d 60  -n 2 -b >top.log 2>&1 &
ps -e -o 'pid,comm,args,pcpu,rsz,vsz,stime,user,uid' > mem.log 2>&1 &
