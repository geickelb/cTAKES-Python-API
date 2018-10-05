#!/bin/bash

#TODO: Add better error handling/troubleshooting.

### Script Beginning ###

PWD=$(pwd)
ORIG=$(echo $PWD/$(dirname $0) | sed 's#/\.##')
cTAKES_HOME="$ORIG/apache-ctakes-4.0.0"

printf "\n\u0F36 Install directory: $cTAKES_HOME \n"

### Checking for dependencies ###

printf "\n\u0F36 Checking for dependencies...\n"

# Jave Check #

if type -p java 2>&1 >/dev/null; then
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then     
    _java="$JAVA_HOME/bin/java" 2>&1 >/dev/null
else
    printf "\n  \u2573 Java wasn't found. Please install Java 1.8 or greater and try again!"
	exit 1
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    if [[ "$version" > "1.8" ]] || [[ "$version" > "10.0.0" ]]; then
        printf "\n  \u2713 Java 1.8 or greater is installed!\n"
    else         
        printf "\n  \u2573 Current Java version is $version please upgrade to Java 1.8 or greater!\n"
		exit 1
    fi
fi

# Warn if install exists #

if [ -d "$CTAKES_HOME" ]; then
	printf "\n  \u2573 cTakes install already exists!\n\n"
	exit 1
fi

# Download cTAKES user install file linux #

if [ ! -d "CTAKES_HOME" ]; then
	printf "\n\u0F36 Downloading cTAKES from Apache repo...\n\n"

    wget --progress=bar:force http://www-eu.apache.org/dist/ctakes/ctakes-4.0.0/apache-ctakes-4.0.0-bin.tar.gz -P $ORIG/tmp/ 2>&1 | tail -f -n +6
    tar -xvf $ORIG/tmp/apache-ctakes-4.0.0-bin.tar.gz -C "$ORIG/$CTAKES_HOME"
fi

# Get resource files #

printf "\n\u0F36 Getting cTAKES resource files...\n\n"
cd $ORIG/tmp
wget --progress=bar:force http://sourceforge.net/projects/ctakesresources/files/ctakes-resources-4.0-bin.zip 2>&1 | tail -f -n +6

printf "\u0F36 Unzipping and moving resource files...\n\n"
unzip ctakes-resources-4.0-bin.zip
cp -R $ORIG/tmp/resources/* $ORIG/apache-ctakes-4.0.0/resources
rm -r $ORIG/tmp/

# Update UMLS Credentials #

read -r -p "
༶ Add UMLS credentials? [y/N] " response
response=${response,,}

if [[ "$response" =~ ^(yes|y)$ ]]; 
then
    read -r -p "༶ Username: `echo $'\n> '`" username
    username=${username,,}

    set_password() {

        read -rs -p "༶ Password: `echo $'\n> '`" password_1
        password_1=${password_1}

        read -rs -p "`echo $'\r'`༶ Verify Password: `echo $'\n> '`" password_2
        password_2=${password_2}

        if [[ $password_1 = $password_2 ]];then
            credentials=" -Dctakes.umlsuser=$username -Dctakes.umlspw=$password_1"

            sed -i -e "s/\(java\)/\1$credentials/" $ORIG/apache-ctakes-4.0.0/bin/runctakesCVD.sh
            sed -i -e "s/\(java\)/\1$credentials/" $ORIG/apache-ctakes-4.0.0/bin/runctakesCPE.sh
        else
            printf "\n༶ Password mismatch try again...\n"
            set_password
        fi
    }
    set_password
    printf "\n\u0F36 UMLS credentials updated!\n"
else
    printf "\n\u0F36 No worries you can add them manually later!\n"
fi
printf "\n\u0FC9 DONE!\n\n"