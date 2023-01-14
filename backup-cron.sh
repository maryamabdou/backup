#! /usr/bin/sh

arg=$*

if [ -e "$2/directory-info.last" ]
then
	:
else
	dt=$(date +'%Y-%m-%d'-'%H-%M-%S')
	cp -p -r $1/dir $2/backupdir/$dt
	ls -l $2/backupdir/$dt > $2/directory-info.last
fi

ls -l $1/dir > $2/directory-info.new

if cmp "$2/directory-info.last" "$2/directory-info.new"
then
	:
else
	dt=$(date +'%Y-%m-%d'-'%H-%M-%S')
	cp -p -r $1/dir $2/backupdir/$dt
	ls -l $2/backupdir/$dt > $2/directory-info.last
fi

count=$(find $2/backupdir -mindepth 1 -type d | wc -l)	
if [ $count -gt $3 ]
then
	first=$(ls $2/backupdir | head -1)
	rm -r $2/backupdir/$first
fi
