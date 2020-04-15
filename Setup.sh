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
  cd TiddlyWiki5
  TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
  cd ..
  echo $TAG > ./TiddlyWikiVersion.txt
fi


echo "Checking for newer versions of tiddlywiki"
CURRENTTAG=$(<./TiddlyWikiVersion.txt)
cd TiddlyWiki5
NEWESTTAG=$(git ls-remote --tags | grep -o 'refs/tags/v[0-9]*\.[0-9]*\.[0-9]*' | sort -rV | head -n 1 | grep -o '[^\/]*$')
cd ..
if [ ! $CURRENTTAG == $NEWESTTAG ]; then
  echo "You are using version $CURRENTTAG but $NEWESTTAG is available."
  echo "Warning: If you have modified the core this will overwrite your
  changes!!!"
  echo "Do you wish to update to $NEWESTTAG? (enter 1 or 2 for yes or no)"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) UPDATE="yes"; break;;
      No ) UPDATE=""; break;;
    esac
  done
  if [ $UPDATE ]; then
    cd TiddlyWiki5
    git reset --hard
    git fetch --tags
    git checkout $NEWESTTAG
    cd ..
    echo $NEWESTTAG > ./TiddlyWikiVersion.txt
  fi
else
  echo "You have the newest version, $CURRENTTAG"
fi

#echo "Patching tiddlywiki to work with this version of the plugin library
#creator."
#./PatchMakeLibrary.sh

echo "
Enter the author name, this will be used as the author name for plugins you
create. It can be changed in the future by reruning this script or editing
Author.txt
"

CURRENTNAME="DEFAULTAUTHOR"
CURRENTFOLDER="$(pwd)"

if [ -f ./Author.txt ]; then
  CURRENTNAME=$(<./Author.txt)
fi

echo "Author Name (press enter to leave as $CURRENTNAME):"
read AUTHORNAME

if [ "$AUTHORNAME" ]; then
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
if [ ! -d ./Wikis ]; then
  mkdir ./Wikis
fi

echo "$CURRENTFOLDER/Plugins" > ./PluginFolder.txt
echo "$CURRENTFOLDER/Themes" > ./ThemeFolder.txt
echo "$CURRENTFOLDER/Languages" > ./LanguageFolder.txt
