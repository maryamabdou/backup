# Backup a directory
This script can be used to backup the user's own directory in the path you
specify.

## Overview of the code
After executing the code, a backup of the directory is formed and
its content is copied to a file called `directory-info.last`.
An infinite loop is made, to check if any update happened to the
directory. The content of the directory is copied to a file called
`directory-info.new`. The last and new files are compared and if 
there is any difference between them, a new backup is made.
There is a maximum number of backups, if the number exceeded then 
the oldest backup will be erased.

## Running the script
You can run this script by three different ways:
1) Run the script file
2) Run the script using make
3) Run the script using cron job

### 1- Bash script file
Go to the path of the bash script and run`./backupd.sh dir backupdir interval max`

**Parameters:**
* `dir` the source directory that have list of file we need to backup <br />
* `backupdir` the destination directory that will have the backup <br />
* `interval` time to wait between every check <br />
* `max` maximum number of backups need to be reserved <br />

### 2- Make file
Open the Makefile and add your arguments in it, then run `make`

### 3- Cron job
Install cron by running `sudp apt install cron` <br />
Run `crontab -e` and type at the end `* * * * * $PATH/backup-cron.sh dir 
backupdir max` <br />
To save, `Ctrl+x` and then type `y` and `Enter`

The crontab syntax consists of **five** asterisks with the following possible values: <br />
* **Minute** -> The minute of the hour the command will run on, ranging from 0-59 <br />
* **Hour** -> The hour the command will run at, ranging from 0-23 <br />
* **Day of the month** -> The day of the month the user wants the command to run on, ranging from 1-31 <br />
* **Month** -> The month that the user wants the command to run in, ranging from 1-12 <br />
* **Day of the week** -> The day of the week for the command to run on, ranging from 0-6, representing Sunday-Saturday. <br />

To run this backup **every 3rd Friday of the month at 12:31 am**<br /> 
**First solution** -> First make it run every friday by replacing the five asterisks by `31 12 * * 5`
then, type in the script file`if [ $(date +%d) -lt 22 -a $(date +%u) 
-eq 4 ]; then ...; else : ; fi` <br />
**Second solution** -> replace the five asterisks by `31 12 15-21 * 5`
