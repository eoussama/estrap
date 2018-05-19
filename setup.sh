#!/usr/bin/bash
# Web Environment setup

# The author's name to show up on the <meta name="author" content=""> tag.
AUTHOR="EOussama"

# The name of the folder that will contain javascript files.
SCRIPTS_FOLDER="scripts"

# The name of the folder that will contain CSS files.
STYLES_FOLDER="styles"

# The name of the folder that will contain images.
IMAGES_FOLDER="images"

# The name of the folder that will contain fonts.
FONTS_FOLDER="fonts"

# Setting this to true will include EOmponents in your project.
EOMPONENTS=true

# Setting this to true will include bootstrap in your project [if set to true, jQuery will automatically be included], and vice versa.
BOOTSTRAP=false

# Setting this to true will include jQuery in your project [including bootsrap will have this set to true regardless], and vice versa.
JQUERY=false

# Setting this to true will include the font awesome cdn, and vice versa.
FONTAWESOME=true




echo "---------------------------------------------------------------------------------------------------------------------"
echo "Parameters (To change these, open up the .bat file with a text editor)"
echo "[Author = $AUTHOR] - [EOmponents = $EOMPONENTS] - [Bootstrap = $BOOTSTRAP] - [jQuery = $JQUERY] - [Font Awesome = $FONTAWESOME]"
echo "---------------------------------------------------------------------------------------------------------------------"

read -p "Enter a name for your project: " PROJECT_NAME
read -p "Enter a description for your project: " PROJECT_DESC
read -p "Enter some keywords for your project: " PROJECT_KEYWORDS

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
CreateFolder "$SCRIPTS_FOLDER"
CreateFolder "$STYLES_FOLDER"
CreateFolder "$IMAGES_FOLDER"

if [ "$EOMPONENTS" == "true" ]
then
	cp "resources/EOmponents/styles/eomponents.css" "exports/$PROJECT_NAME/$STYLES_FOLDER/eomponents.css"
    cp "resources/EOmponents/scripts/eomponents.js" "exports/$PROJECT_NAME/$SCRIPTS_FOLDER/eomponents.js"
    
    mkdir "exports/$PROJECT_NAME/$FONTS_FOLDER"
    cp -r "resources/EOmponents/fonts/Roboto/" "exports/$PROJECT_NAME/$FONTS_FOLDER/Roboto/"
fi

if [ "$BOOTSTRAP" == "true" ]
then
	cp "resources/bootstrap/css/bootstrap.min.css" "exports/$PROJECT_NAME/$STYLES_FOLDER/bootstrap.min.css"
    cp "resources/bootstrap/js/bootstrap.min.js" "exports/$PROJECT_NAME/$SCRIPTS_FOLDER/bootstrap.min.js"
fi

if [ "$JQUERY" == "true" ]
then
    cp "resources/jQuery/jquery-3.3.1.min.js" "exports/$PROJECT_NAME/$SCRIPTS_FOLDER/jquery-3.3.1.min.js"
fi

if [ "$FONTAWESOME" == "true" ]
then
	cp -r "resources/font-awesome/" "exports/$PROJECT_NAME/fonts/"
fi

CreateFile "$SCRIPTS_FOLDER/main.js" "// $PROJECT_NAME by $AUTHOR"
CreateFile "$STYLES_FOLDER/main.css" "/* $PROJECT_NAME by $AUTHOR */"
CreateFile "index.html"

JQUERY_JS_ADDON=""
BOOTSTRAP_CSS_ADDON=""
BOOSTRAP_JS_ADDON=""
EOMPONENTS_CSS_ADDON=""
EOMPONENTS_JS_ADDON=""
FONTAWESOME_CSS_ADDON=""

if [ $BOOTSTRAP == "true" ]
then
    BOOTSTRAP_CSS_ADDON="<link rel=\"stylesheet\" type=\"text/css\" href=\"$STYLES_FOLDER/bootstrap.min.css\">"
    BOOTSTRAP_JS_ADDON="<script type=\"text/javascript\" src=\"$SCRIPTS_FOLDER/bootstrap.min.js\"></script>"
    JQUERY="true"
fi

if [ $JQUERY == "true" ]
then
    JQUERY_JS_ADDON="<script type=\"text/javascript\" src=\"$SCRIPTS_FOLDER/jquery-3.3.1.min.js\"></script>"
fi

if [ $EOMPONENTS == "true" ]
then
    EOMPONENTS_CSS_ADDON="<link rel=\"stylesheet\" type=\"text/css\" href=\"$STYLES_FOLDER/eomponents.css\">"
    EOMPONENTS_JS_ADDON="<script type=\"text/javascript\" src=\"$SCRIPTS_FOLDER/eomponents.js\"></script>"
fi

if [ $FONTAWESOME == "true" ]
then
    FONTAWESOME_CSS_ADDON="<link rel=\"stylesheet\" type=\"text/css\" href=\"$FONTS_FOLDER/font-awesome/css/fontawesome-all.min.css\">"
fi

echo -e '<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="'"$AUTHOR"'">
        <meta name="application-name" content="'"$PROJECT_NAME"'">
        <meta name="description" content="'"$PROJECT_DESC"'">
        <meta name="keywords" content="'"$PROJECT_KEYWORDS"'">

        '"$FONTAWESOME_CSS_ADDON"'
        '"$BOOTSTRAP_CSS_ADDON"'
        '"$EOMPONENTS_CSS_ADDON"'
        <link rel="shortcut icon" type="image/png" href="'"$IMAGES_FOLDER"'/">
        <link rel="stylesheet" type="text/css" href="'"$STYLES_FOLDER"'/main.css">

        <title>'"$PROJECT_NAME"'</title>
    </head>

    <body>

        '"$JQUERY_JS_ADDON"'
        '"$BOOTSTRAP_JS_ADDON"'
        '"$EOMPONENTS_JS_ADDON"'
        <script type="text/javascript" src="'"$SCRIPTS_FOLDER"'/main.js"></script>
    </body>
</html>
' > "exports/$PROJECT_NAME/index.html"

echo "'$PROJECT_NAME' was successfully created!"
exit