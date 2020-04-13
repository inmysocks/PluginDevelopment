#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)
#
# This starts a wiki server on a given port, defaulting to 8080
#
# Usage: ./start.sh wiki 8888

if [ ! -f ./PluginFolder.txt ]; then
  echo "Run Setup.sh before running this."
  exit 0
fi

WIKI="wiki"
PORT="8080"

if [ $1 ]; then
  WIKI=$1
fi

if [ $2 ]; then
  PORT=$2
fi

export TIDDLYWIKI_PLUGIN_PATH=$(<PluginFolder.txt)
export TIDDLYWIKI_THEME_PATH=$(<ThemeFolder.txt)
export TIDDLYWIKI_LANGUAGE_PATH=$(<LanguageFolder.txt)

node ./TiddlyWiki5/tiddlywiki.js ./Wikis/$WIKI --listen port=$PORT
