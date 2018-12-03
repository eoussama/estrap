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



# Shows a message and pauses the script.
Pause() {
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

# Creates a file.
CreateFile() {
    touch "$1/$2/$3"
    echo "$4" >> "$1/$2/$3"
}



# The project's name.
PROJECT_NAME=$1

# The template's name.
TEMPLATE_NAME=$2

# The directory of the bash script.
ESTRAP_PATH=`dirname $0`

# The current directory.
CURRENT_PATH=$(pwd)



# Creating the templates' folder.
CreateFolder $ESTRAP_PATH "templates"

# Creating the html template.
CreateFolder $ESTRAP_PATH "templates/html"
CreateFolder $ESTRAP_PATH "templates/html/assets"
CreateFolder $ESTRAP_PATH "templates/html/assets/js"
CreateFolder $ESTRAP_PATH "templates/html/assets/css"
CreateFolder $ESTRAP_PATH "templates/html/assets/img"
CreateFile $ESTRAP_PATH "templates/html" "index.html" ""
CreateFile $ESTRAP_PATH "templates/html/assets/js" "main.js" ""
CreateFile $ESTRAP_PATH "templates/html/assets/css" "main.css" ""

# Creating the php template.
CreateFolder $ESTRAP_PATH "templates/php"
CreateFolder $ESTRAP_PATH "templates/php/config"
CreateFolder $ESTRAP_PATH "templates/php/controllers"
CreateFolder $ESTRAP_PATH "templates/php/models"
CreateFolder $ESTRAP_PATH "templates/php/public"
CreateFolder $ESTRAP_PATH "templates/php/public/assets"
CreateFolder $ESTRAP_PATH "templates/php/public/assets/js"
CreateFolder $ESTRAP_PATH "templates/php/public/assets/css"
CreateFolder $ESTRAP_PATH "templates/php/public/assets/img"
CreateFolder $ESTRAP_PATH "templates/php/public/views"
CreateFolder $ESTRAP_PATH "templates/php/public/views/partials"
CreateFolder $ESTRAP_PATH "templates/php/utils"
CreateFile $ESTRAP_PATH "templates/php" ".htaccess" ""
CreateFile $ESTRAP_PATH "templates/php/config" "config.ini" ""
CreateFile $ESTRAP_PATH "templates/php/config" "config.php" ""
CreateFile $ESTRAP_PATH "templates/php/public" "index.php" ""
CreateFile $ESTRAP_PATH "templates/php/public/assets/js" "main.js" ""
CreateFile $ESTRAP_PATH "templates/php/public/assets/css" "main.css" ""

# Creating the node template.
CreateFolder $ESTRAP_PATH "templates/node"
CreateFolder $ESTRAP_PATH "templates/node/models"
CreateFolder $ESTRAP_PATH "templates/node/public"
CreateFolder $ESTRAP_PATH "templates/node/public/assets"
CreateFolder $ESTRAP_PATH "templates/node/public/assets/js"
CreateFolder $ESTRAP_PATH "templates/node/public/assets/css"
CreateFolder $ESTRAP_PATH "templates/node/public/assets/img"
CreateFolder $ESTRAP_PATH "templates/node/views"
CreateFolder $ESTRAP_PATH "templates/node/views/partials"
CreateFile $ESTRAP_PATH "templates/node" "app.js" ""
CreateFile $ESTRAP_PATH "templates/node/public/assets/js" "main.js" ""
CreateFile $ESTRAP_PATH "templates/node/public/assets/css" "main.css" ""

# Check if the project's name is passed.
if [ -z "$PROJECT_NAME" ] || [ -z "$TEMPLATE_NAME" ]
then
    Pause "Usage: estrap --project-name --template-name"
else
    # Check if the template exists.
    if [ -e "$ESTRAP_PATH/templates/$TEMPLATE_NAME" ]
    then
        # Creating the project's folder.
        CreateFolder $CURRENT_PATH $PROJECT_NAME

        # Displaying the end message.
        Pause "“$PROJECT_NAME” was successfully created!"
    else
        Pause "The template “$TEMPLATE_NAME” doesn't exist."
    fi
fi
