#!/bin/bash

set -euo pipefail

APP_REPOSITORY="https://github.com/aleksandrmajlo/devops_todolist_terraform_task.git"
TEMP_DIRECTORY="/tmp/devops_todolist_terraform_task"
APP_DIRECTORY="/app"

# Install the packages required by the application.
apt-get update -yq
apt-get install -yq python3 python3-pip git

# Download the application source code.
rm -rf "${TEMP_DIRECTORY}"
git clone --depth 1 "${APP_REPOSITORY}" "${TEMP_DIRECTORY}"

# Copy the application files into their permanent directory.
rm -rf "${APP_DIRECTORY}"
mkdir -p "${APP_DIRECTORY}"
cp -a "${TEMP_DIRECTORY}/app/." "${APP_DIRECTORY}/"

# The service must be able to execute the startup script.
chmod +x "${APP_DIRECTORY}/start.sh"

# Install and start the systemd service.
mv "${APP_DIRECTORY}/todoapp.service" /etc/systemd/system/todoapp.service

systemctl daemon-reload
systemctl enable todoapp
systemctl restart todoapp