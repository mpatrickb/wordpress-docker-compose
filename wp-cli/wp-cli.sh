#!/bin/bash

sleep 45s

# Prepare variables
TABLE="wp_options"
SQL_EXISTS=$(printf 'SHOW TABLES LIKE "%s"' "$TABLE")
SQL_IS_EMPTY=$(printf 'SELECT 1 FROM %s LIMIT 1' "$TABLE")

# Credentials
USERNAME=root    
PASSWORD=password
DATABASE=wordpress

if [[ $(mysql --host 127.0.0.1 --port 3306 -u $USERNAME -p $PASSWORD -e "$SQL_EXISTS" $DATABASE) ]]
then
    echo "Table exists ..."

    # Check if table has records    
    if [[ $(mysql --host 127.0.0.1 --port 3306 -u $USERNAME -p $PASSWORD -e "$SQL_IS_EMPTY" $DATABASE) ]]
    then
        echo "Table has records ..."
    else
       wordpress
    fi
else
    wordpress
fi

    #wp core download
    #wp core config
    #wp core install --url=http://localhost --title=SiteTitle --admin_user=username --admin_password=mypassword --admin_email=my@email.com
    wp core install
    wp language core install nl_NL
    wp site switch-language nl_NL
    #wp language core activate nl_NL
    #wp plugin install bbpress --activate
wp theme install oceanwp --activate
wp plugin install ocean-extra --activate
wp plugin install translatepress-multilingual --activate
wp plugin install wordpress-seo --activate

wp plugin install contact-form-7 --activate
wp plugin install contact-form-7-honeypot --activate

wp plugin install sucuri-scanner --activate

wp plugin install all-in-one-wp-security-and-firewall --activate