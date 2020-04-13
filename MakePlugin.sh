#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)
#
# This script creates an empty plugin in the Plugins folder
#
# Usage: ./MakePlugin.sh PluginName AuthorName

if [ ! -f ./Author.txt ]; then
  echo "Run Setup.sh before running this."
  exit 0
fi

AUTHOR=$(<./Author.txt)
PLUGINNAME="DemoPlugin"
PLUGINFOLDER=$(<PluginFolder.txt)

if [ $1 ]; then
  PLUGINNAME=$1
fi

if [ $2 ]; then
  AUTHOR=$2
fi

if [ -d $PLUGINFOLDER/$AUTHOR ]; then
  mkdir $PLUGINFOLDER/$AUTHOR/$PLUGINNAME
else
  mkdir $PLUGINFOLDER/$AUTHOR
  mkdir $PLUGINFOLDER/$AUTHOR/$PLUGINNAME
fi

echo "{
  \"title\": \"\$:/plugins/$AUTHOR/$PLUGINNAME\",
  \"description\": \"A plugin description goes here\",
  \"author\": \"$AUTHOR\",
  \"version\": \"0.0.1\",
  \"core-version\": \">=5.1.13\",
  \"source\": \"\",
  \"list\": \"readme\",
  \"plugin-type\": \"plugin\"
}" > $PLUGINFOLDER/$AUTHOR/$PLUGINNAME/plugin.info

echo "title: \$:/plugins/$AUTHOR/$PLUGINNAME/readme
caption: readme

Readme text goes here." > $PLUGINFOLDER/$AUTHOR/$PLUGINNAME/readme.tid
