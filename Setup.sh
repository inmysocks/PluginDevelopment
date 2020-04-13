#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)
#
# Setup script for tiddlywiki plugin development

echo "
Welcome to the setup script!

Run this script to help setup your development environment for tiddlywiki 5.
If you move your plugin development folder you must re-run this script.
"

if [ ! -f ./TiddlyWikiVersion.txt ]; then
  echo "Checking out latest release of tiddlywiki5"
  cd TiddlyWiki5
  TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
  git checkout $TAG
  cd ..
  echo "Finished checking out latest release"
fi

#cd TiddlyWiki5
#CURRENTTAG=$(<./TiddlyWikiVersion.txt)
#NEWESTTAG=$(git describe --tags `git rev-list --tags --max-count=1`)
#if [ $CURRENTTAG != $NEWESTTAG ]; then
#  echo "There may be a new version of tiddlywiki available, do you want to get
#  it?"
#  echo "Warning: If you have modified the core this will overwrite your
#  changes!!!"
#  echo "Do you wish to install this program?"
#  select yn in "Yes" "No"; do
#    case $yn in
#      Yes ) UPDATE="yes"; break;;
#      No ) UPDATE="no"; break;;
#    esac
#  done
#  if [ $UPDATE ]; then
#    cd TiddlyWiki5
#    git reset --hard
#    git pull
#    TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
#    git checkout $TAG
#    cd ..
#  fi
#fi

echo "Patching tiddlywiki to work with this version of the plugin library
creator."

./PatchMakeLibrary.sh

echo "
Enter the author name, this will be used as the author name for plugins you
create. It can be changed in the future by reruning this script or editing
Author.txt
"

CURRENTNAME="DEFAULTAUTHOR"
CURRENTFOLDER=$(pwd)

if [ -f ./Author.txt ]; then
  CURRENTNAME=$(<./Author.txt)
fi

echo "Author Name (press enter to leave as $CURRENTNAME):"
read AUTHORNAME

if [ $AUTHORNAME ]; then
  echo $AUTHORNAME > Author.txt
fi

if [ ! -d ./Plugins ]; then
  mkdir ./Plugins
fi
if [ ! -d ./Themes ]; then
  mkdir ./Themes
fi
if [ ! -d ./Languages ]; then
  mkdir ./Languages
fi

echo "$CURRENTFOLDER/Plugins" > ./PluginFolder.txt
echo "$CURRENTFOLDER/Themes" > ./ThemeFolder.txt
echo "$CURRENTFOLDER/Languages" > ./LanguageFolder.txt
