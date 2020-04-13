#!/bin/bash
# Author: Jed Carty April 13 2020 (@inmysocks on GitHub.com)
# Patch makepluginlibrary.js to work with how this makes plugin libraries.

ORIGINAL1="collectPublisherPlugins(path.resolve(\$tw.boot.corePath,\$tw.config.pluginsPath))\;"
NEW1="var pluginsPaths = \$tw.getLibraryItemSearchPaths(\$tw.config.pluginsPath,\$tw.config.pluginsEnvVar);for(var u=0; u<pluginsPaths.length; u++) {collectPublisherPlugins(pluginsPaths[u]);}"
ORIGINAL2="collectPublisherPlugins(path.resolve(\$tw.boot.corePath,\$tw.config.themesPath))\;"
NEW2="var themesPaths = \$tw.getLibraryItemSearchPaths(\$tw.config.themesPath,\$tw.config.themesEnvVar);for(var u=0; u<themesPaths.length; u++) {collectPublisherPlugins(themesPaths[u]);}"
ORIGINAL3="collectPlugins(path.resolve(\$tw.boot.corePath,\$tw.config.languagesPath))\;"
NEW3="var languagesPaths = \$tw.getLibraryItemSearchPaths(\$tw.config.languagesPath,\$tw.config.languagesEnvVar);for(var u=0; u<languagesPaths.length; u++) {collectPlugins(languagesPaths[u]);}"

echo "s/$ORIGINAL1/$NEW1/g"

sed -i "s/$ORIGINAL1/$NEW1/g" ./TiddlyWiki5/core/modules/commands/makelibrary.js
sed -i "s/$ORIGINAL2/$NEW2/g" ./TiddlyWiki5/core/modules/commands/makelibrary.js
sed -i "s/$ORIGINAL3/$NEW3/g" ./TiddlyWiki5/core/modules/commands/makelibrary.js
