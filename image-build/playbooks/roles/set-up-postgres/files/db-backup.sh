#!/bin/sh

##
## Database backup script
##

# Variables
RETAIN_DAYS=5
DATE=$(date +"%Y-%m-%d")
BACKUP_PATH='/var/pgbackup'

# Perform backup
sudo -u postgres pg_dumpall | gzip > $BACKUP_PATH/all_db_backup_$DATE.gz

# Remove old backups
find $BACKUP_PATH -mtime +$RETAIN_DAYS -delete