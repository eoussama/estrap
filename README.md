# Estrap
---

## Description
It gets too repetitive at times to setup your project environment, it's at most cases a very quick and easy task to do, but sometimes it can get pretty messy. Here's an executable file to help you out, while not anything remarkable, it does save time, you're only a command away from setting up a basic web application environment.

## Usage
> Before running the executable, trying opening it on edit mode with any text editor and change the following parameters;

|**Variable**|**Values**|**Description**|
|------------|----------|---------------|
|`AUTHOR`    |string    |The creator's name that will be included in the author meta HTML tag.|
|`LICENSE`|string|The license you wish to use on your projects.|
|`PROJECT_DESCRIPTION`|string|The starter description of your project, would be appended to the description meta HTML tag.|
|`PROJECT_KEYWORDS`|string|The project's keywords, would be appended to the keywords meta HTML tag.|

> Once you've changed the parameters to your liking, do the following in order to set the script to do its own thing.
- Run the *estrap.sh* file, You can either:
    - cd to it and directing run it `./estrap.sh [project name] [project template]`.
    - Register it as an environment variable and run the command `bash estrap.sh [project name] [project template]`.
- Input your project's name and template as parameters

Done, how fast was that?
