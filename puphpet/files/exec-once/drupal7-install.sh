#!/bin/bash
#
# Installs Drupal 7 using drush.

#
# Variables below correspond to values in PuPHPet's config.yml.
#

# Drupal install directory.
DRUPAL_DIR=/var/www/drupal7

# Drupal URL.
DRUPAL_URI=drupal7.local

#Drupal site name.
DRUPAL_NAME="Drupal 7"

# MySQL DB name and credentials.
DRUPAL_MYSQL_USER=admin
DRUPAL_MYSQL_PASSWORD=password
DRUPAL_MYSQL_DB=drupal7

# Drupal administrator's credentials.
DRUPAL_USER_NAME=admin
DRUPAL_USER_PASSWORD=password
DRUPAL_USER_MAIL=admin@example.com

# Start installation.
echo '****** DRUPAL 7 INSTALLATION ******'
drush --root=${DRUPAL_DIR} --uri=http://${DRUPAL_URI} site-install standard --db-url=mysql://${DRUPAL_MYSQL_USER}:${DRUPAL_MYSQL_PASSWORD}@localhost/${DRUPAL_MYSQL_DB} --account-name=${DRUPAL_USER_NAME} --account-pass=${DRUPAL_USER_PASSWORD} --account-mail=${DRUPAL_USER_MAIL} --site-mail=${DRUPAL_USER_MAIL} --site-name=${DRUPAL_NAME} -y

# Change permissions for files directory.
sudo sh -c "chmod g+s ${DRUPAL_DIR}/sites/default/files"

# Show information about installed Drupal.
drush status --root=${DRUPAL_DIR}