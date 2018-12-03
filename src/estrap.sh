#!/usr/bin/bash

# -----------------------------------------------------------
#
# @name:        Estrap
# @version:     0.5.0
# @author:      EOussama
# @source:      https://github.com/EOussama/web-env-setup
# @license:     Apache-2.0
#
# -----------------------------------------------------------


# Shows an error message and pauses the script.
Error() {
    echo "[Estrap] $1"
    read -p "Press any key in order to continue: "
}

# Creates a folder.
CreateFolder() {
    if [ ! -e "$1/$2" ]
    then
        mkdir "$1/$2"
    fi
}


# The project's name.
PROJECT_NAME=$1

# The directory of the bash script.
ESTRAP_PATH=`dirname $0`

# The current directory.
CURRENT_PATH=$(pwd)


# Creating the templates' folder.
CreateFolder $ESTRAP_PATH "templates"

# Check if the project's name is passed.
if [ -z "$PROJECT_NAME" ]
then
    Error "Usage: estrap --project-name"
else
    # Creating the project's folder.
    CreateFolder $CURRENT_PATH $PROJECT_NAME

    # End message.
    echo "[Estrap] $PROJECT_NAME was successfully created!"
fi
