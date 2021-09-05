#!/bin/sh

# Copy cronjob to /etc/cron.d
cp -p /usr/local/bin/db_backup_cronjob /etc/cron.d/db_backup_cronjob

# Restart cron
/etc/init.d/cron restart
