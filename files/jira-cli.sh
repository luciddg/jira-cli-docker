#!/bin/bash
#
# A wrapper for dockerized jira-cli to use bind mounted config files.
#

CONFIG_FILE=/etc/jira-cli.conf
LATEST_VERSION_PATH=$(find /opt -maxdepth 1 -type d -name 'jira-cli-*' | sort -V | tail -1)
LATEST_VERSION=$(basename ${LATEST_VERSION_PATH})

# parse config file for options
if [ -f "${CONFIG_FILE}" ]; then
  SANITIZED_CONFIG=$(egrep '^[^ ]*=[^;&]*' "${CONFIG_FILE}")
  for option in $SANITIZED_CONFIG; do
    eval $option
  done
  # run with the options
  java -jar ${LATEST_VERSION_PATH}/lib/${LATEST_VERSION}.jar \
    --server "$server" \
    --user "$user" \
    --password "$password" \
    "$@"
else
  java -jar ${LATEST_VERSION_PATH}/lib/${LATEST_VERSION}.jar "$@"
fi
