#!/bin/bash
arg=$*
dt=$(date +'%Y-%m-%d'-'%H-%M-%S')
cp -p -r $1/dir $2/backupdir/$dt
ls -lR $2/backupdir/$dt > $2/directory-info.last

while true
do
	sleep $3
	ls -lR $1/dir > $2/directory-info.new
	
	last=$(tail -n +2 $2/directory-info.last)
	new=$(tail -n +2 $2/directory-info.new)

#        if diff <(tail -n +2 $2/directory-info.last) <(tail -n +2 $2/directory-info.new)
	if [[ "$last" == "$new" ]]
	then
		:
	else
		dt=$(date +'%Y-%m-%d'-'%H-%M-%S')
		cp -p -r $1/dir $2/backupdir/$dt
		ls -lR $2/backupdir/$dt > $2/directory-info.last
	fi
	
	count=$(find $2/backupdir -mindepth 1 -type d | wc -l)	
	if [ $count -gt $4 ]
	then
		first=$(ls $2/backupdir | head -1)
		rm -r $2/backupdir/$first
	fi
done
