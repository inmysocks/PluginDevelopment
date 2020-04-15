#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)
# This script creates a wiki using the given name and edition. If none are
# given it defaults to the name wiki and the empty edition.
#
# Usage: ./MakeWiki.sh someWiki empty

NAME="wiki"
EDITION="empty"

if [ "$1" ]; then
    NAME=$1
fi

if [ "$2" ]; then
    EDITION=$2
fi

node ./TiddlyWiki5/tiddlywiki.js "$(pwd)/Wikis/$NAME" --init $EDITION

if [ -f "$(pwd)/Wikis/$NAME/tiddlywiki.info" ]; then
    echo "New wiki created in $(pwd)/Wikis/$Name using $EDITION edition"
else
    echo "Error creating wiki. If you make a bug report please include all the output after you ran MakeWiki.sh"
fi
