DIR= .
BACKUP= .
INTERVAL= 2
MAX= 3

cond:
	if [ -d "$(BACKUP)/backupdir" ]; then\
		echo "exist"; ./backupd.sh $(DIR) $(BACKUP) $(INTERVAL) $(MAX); \
	else echo "doesn't"; mkdir -p $(BACKUP)/backupdir; ./backupd.sh $(DIR) $(BACKUP) $(INTERVAL) $(MAX); \
	fi

