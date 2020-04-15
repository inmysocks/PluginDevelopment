#!/bin/bash

OLD="\"plugins\": \["

NEW="\"plugins\": \[\
        \"$1\","

sed -i".bak" "s#$OLD#$NEW#g" "./Wikis/$2/tiddlywiki.info"