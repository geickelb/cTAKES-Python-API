#!/bin/bash

# PWD=$(pwd)
# ORIG=$(echo $PWD/$(dirname $0) | sed 's#/\.##')
# CTAKES_DEV_HOME="$ORIG/ctakes"
# CTAKES_SRC_HOME="${CTAKES_DEV_HOME}/trunk"
# printf "\n\u0F36 Subversion repo: \n  $CTAKES_DEV_HOME \n"
# printf "\n\u0F36 Install directory: \n  $CTAKES_SRC_HOME \n"

# # check for dependencies
# printf "\n\u0F36 Checking for dependencies...\n"

# # Java check
# if type -p java 2>&1 >/dev/null; then
#     _java=java
# elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then     
#     _java="$JAVA_HOME/bin/java" 2>&1 >/dev/null
# else
#     printf "\n  \u2573 Java wasn't found. Please install Java 1.8 or greater and try again!"
# 	exit 1
# fi

# if [[ "$_java" ]]; then
#     version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
#     if [[ "$version" > "1.8" ]] || [[ "$version" > "10.0.0" ]]; then
#         printf "\n  \u2713 Java 1.8 or greater is installed!"
#     else         
#         printf "\n  \u2573 Current Java version is $version please upgrade to Java 1.8 or greater!"
# 		exit 1
#     fi
# fi
# # Maven check
# mvn --version 2>&1 >/dev/null

# if [ 1 == $? ]; then
# 	printf "\n  \u2573 Maven isn\'nt installed!\n"
# 	exit 1
# else
# 	printf "\n  \u2713 Maven is installed!"
# fi
# # Subversion check
# which svn 2>&1 >/dev/null

# if [ 1 == $? ]; then
# 	printf "\n  \u2573 Subversion isn\'nt installed!\n"
# 	exit 1
# else
# 	printf "\n  \u2713 Subversion is installed!\n"
# fi

# # warn if we already have an install
# if [ -d "$CTAKES_SRC_HOME" ]; then
# 	printf "\n\u0F36 cTakes install already exists. Remove it to install again or execute run.sh to start the program.\n\n"
# 	exit 1
# fi

# # checkout ctakes from SVN
# if [ ! -d "$CTAKES_DEV_HOME" ]; then
# 	mkdir $CTAKES_DEV_HOME
# 	printf "\n\u0F36 Checking out cTAKES from Subversion repo... \n"
# 	out_svn=$(svn co https://svn.apache.org/repos/asf/ctakes/trunk "$CTAKES_DEV_HOME")
# else
# 	printf "\n\u0F36 Updating cTAKES repo... \n"
# 	cd $CTAKES_DEV_HOME
# 	out_svn=$(svn up)
# 	cd ..
# fi

# if [ 1 == $? ]; then
# 	printf "\n\u2573 Failed to checkout cTAKES, here's Subversion's output:\n"
# 	echo $out_svn
# 	exit 1
# fi


# if [ ! -d "${CTAKES_SRC_HOME}" ]; then
# 	mkdir ${CTAKES_SRC_HOME}
# 	cd ${CTAKES_SRC_HOME}

# 	printf "\n\u0F36 Fetching cTAKES git source...\n\n"
# 	git init .
# 	git remote add apache https://github.com/apache/ctakes.git
# 	git fetch apache
# 	git pull apache trunk

# 	printf "\n\u0F36 Rebasing after svn checkin...\n\n"
# 	git checkout trunk
# 	svn update
# 	git checkout .
# 	git pull --rebase apache trunk

# fi

# # # package with Maven
# # printf "\n\u0F36 Packaging cTAKES with Maven...\n"
# # cd "$CTAKES_DEV_HOME"
# # out_mvn=$(mvn package) 

# # if [ 1 == $? ]; then
# # 	printf "\n\u2573 Failed to package cTAKES, here's Maven's output:\n"
# # 	echo $out_mvn
# # 	exit 1
# # fi

# # # extract and move built products into place
# # printf "\n\u0F36  Moving cTAKES to $CTAKES_SRC_HOME...\n"
# # base=$(echo ctakes-distribution/CTAKES_SRC_HOME/*-bin.tar.gz)
# # tar xzf $base
# # mv $(basename ${base%-bin.tar.gz}) "$CTAKES_SRC_HOME"

# # # download resources
# # cd "$CTAKES_SRC_HOME"
# # if [ -z ctakes-resources.zip ]; then
# # 	printf "\n\u0F36  Downloading cTAKES resources...\n"
# # 	curl -o ctakes-resources.zip "http://hivelocity.dl.sourceforge.net/project/ctakesresources/ctakes-resources-4.0.0.zip"
# # 	tar xzf ctakes-resources.zip
# # fi

# # # add special classes and scripts
# # printf "\n\u0F36  Adding special files...\n"
# # cp "$ORIG/run.sh" "$CTAKES_SRC_HOME/"
# # cp "$ORIG/log4j.xml" "$CTAKES_SRC_HOME/config/"
# # cp "$ORIG"/*.class "$CTAKES_SRC_HOME/"
# # cp "$ORIG"/*.java "$CTAKES_SRC_HOME/"
# # cp "$ORIG"/*.xml "$CTAKES_SRC_HOME/"

# printf "\n\u0FC9  Done!\n\n"

PWD=$(pwd)
ORIG=$(echo $PWD/$(dirname $0) | sed 's#/\.##')
cTAKES_HOME="$ORIG/apache-ctakes-4.0.0"

printf "\n\u0F36 Install directory: $cTAKES_HOME \n"

# check for dependencies
printf "\n\u0F36 Checking for dependencies...\n"

# Java check
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

# warn if we already have an install
if [ -d "$CTAKES_HOME" ]; then
	printf "\n  \u2573 cTakes install already exists!\n\n"
	exit 1
fi

# Download user install file linux
if [ ! -d "CTAKES_HOME" ]; then
	printf "\n\u0F36 Downloading cTAKES from Apache repo...\n\n"

    wget http://www-eu.apache.org/dist/ctakes/ctakes-4.0.0/apache-ctakes-4.0.0-bin.tar.gz -P $ORIG/tmp/
    tar -xvf $ORIG/tmp/apache-ctakes-4.0.0-bin.tar.gz -C "$ORIG/$CTAKES_HOME"
    rm -r $ORIG/tmp/apache-ctakes-4.0.0-bin.tar.gz
fi

# Get resource files
printf "\n\u0F36 Getting resource files...\n\n"
cd $ORIG/tmp
wget http://sourceforge.net/projects/ctakesresources/files/ctakes-resources-4.0-bin.zip

printf "\n\u0F36 Unzipping and moving resource files...\n\n"
unzip ctakes-resources-4.0-bin.zip
cp -R $ORIG/tmp/resources/* $ORIG/apache-ctakes-4.0.0/resources
rm -r $ORIG/tmp/

printf "\n\u0F36 Don\'t forget to update /bin/runctakesCVD.sh & /bin/runctakesCPE.sh at cTAKES_HOME with your UMLS credentials!\n"
printf "\n\u0F36 Example: java -Dctakes.umlsuser=<YOUR_UMLS_ID_HERE> -Dctakes.umlspw=<YOUR_UMLS_PASSSWORD_HERE> -cp ...\n"

printf "\n\u0FC9 DONE!\n\n"