#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)

if [ ! -f ./Author.txt ]; then
  echo "Run Setup.sh before running this."
  exit 0
fi

# You have to change this to match your actual plugin path
export TIDDLYWIKI_PLUGIN_PATH=$(<PluginFolder.txt)
export TIDDLYWIKI_THEME_PATH=$(<ThemeFolder.txt)
export TIDDLYWIKI_LANGUAGE_PATH=$(<LanguageFolder.txt)

node ./TiddlyWiki5/tiddlywiki.js ./PluginLibrary --build mylibrary
