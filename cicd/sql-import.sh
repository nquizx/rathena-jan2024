#!/usr/bin/env bash

set -euxo pipefail

function aborterror {
	echo $@
	exit 1
}

# Github Actions default login data
DB_ROOT=root
DB_ROOTPW=quidapchai
# rAthena default MySQL data
DB_HOST=localhost
DB_NAME=ro2024
DB_USER=ro2024username
DB_PASS=ro2024password

mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/main.sql || aborterror "Unable to import main database."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/logs.sql || aborterror "Unable to import logs database."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db.sql || aborterror "Unable to import pre-renewal item table structure."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_usable.sql || aborterror "Unable to import pre-renewal usable item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_equip.sql || aborterror "Unable to import pre-renewal equip item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_etc.sql || aborterror "Unable to import pre-renewal etc item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db2.sql || aborterror "Unable to import pre-renewal item 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_re.sql || aborterror "Unable to import renewal item table structure."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_re_usable.sql || aborterror "Unable to import renewal usable item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_re_equip.sql || aborterror "Unable to import renewal equip item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db_re_etc.sql || aborterror "Unable to import renewal etc item table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/item_db2_re.sql || aborterror "Unable to import renewal item 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_db.sql || aborterror "Unable to import pre-renewal monster table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_db2.sql || aborterror "Unable to import pre-renewal monster 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_db_re.sql || aborterror "Unable to import renewal monster table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_db2_re.sql || aborterror "Unable to import renewal monster 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_skill_db.sql || aborterror "Unable to import pre-renewal monster skill table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_skill_db2.sql || aborterror "Unable to import pre-renewal monster skill 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_skill_db_re.sql || aborterror "Unable to import renewal monster skill table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/mob_skill_db2_re.sql || aborterror "Unable to import renewal monster skill 2 table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/roulette_default_data.sql || aborterror "Unable to import roulette table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/tbro_custom_1.sql || aborterror "Unable to import tieubachro custom table."
mysql -h 127.0.0.1 -P 3306 -u $DB_ROOT -p$DB_ROOTPW $DB_NAME < sql-files/web.sql || aborterror "Unable to import web table."

# # MariaDB
# mysql -u $DB_ROOT -p$DB_ROOTPW -e "SET old_passwords=0; CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASS';"
# # MySQL
# mysql -u $DB_ROOT -p$DB_ROOTPW -e "CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED WITH mysql_native_password BY '$DB_PASS';"
# mysql -u $DB_ROOT -p$DB_ROOTPW -e "GRANT SELECT,INSERT,UPDATE,DELETE ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST';"
