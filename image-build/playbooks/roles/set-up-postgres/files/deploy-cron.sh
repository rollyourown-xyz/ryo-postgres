#!/bin/sh
# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Copy cronjob to /etc/cron.d
cp -p /usr/local/bin/db_backup_cronjob /etc/cron.d/db_backup_cronjob

# Restart cron
/etc/init.d/cron restart
