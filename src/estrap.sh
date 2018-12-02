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

echo "-------------------------------------------------"
echo "                                                 "
echo "                  Estrap v0.0.5                  "
echo "                  -------------                  "
echo "                                                 "
echo "-------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Parameters (To change these, open up the .bat file with a text editor)"
echo "[Author = $AUTHOR] - [EOmponents = $EOMPONENTS] - [Bootstrap = $BOOTSTRAP] - [jQuery = $JQUERY] - [Font Awesome = $FONTAWESOME]"
echo "---------------------------------------------------------------------------------------------------------------------"

read -p "Enter a name for your project: " PROJECT_NAME
read -p "Enter a description for your project: " PROJECT_DESC
read -p "Enter some keywords for your project: " PROJECT_KEYWORDS
:'
if [ ! -e "exports" ]
then
    mkdir "exports"
fi

CreateFolder() {
    mkdir "exports/$PROJECT_NAME/$1"
    return
}

CreateFile() {
    touch "exports/$PROJECT_NAME/$1"
    echo "$2" >> "exports/$PROJECT_NAME/$1"
    return
}

mkdir "exports/$PROJECT_NAME"
mkdir "exports/$PROJECT_NAME/assets"
CreateFolder "assets/$SCRIPTS_FOLDER"
CreateFolder "assets/$STYLES_FOLDER"
CreateFolder "assets/$IMAGES_FOLDER"
'