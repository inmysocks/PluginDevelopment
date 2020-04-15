# TiddlyWiki5 Plugin Development Example

This repo is a stripped down version of what I use to create plugins and make a
plugin library.

It has a few components:

1. its own copy of the TiddlyWiki5 repo, this way you can do anything you want
  here, including modifying the core, and you won't break anything else.
2. A script to start a wiki in a node server.
3. A script to create an empty plugin that you can then edit to make whatever
  you want.
4. A script to create new wikis that you can use to test plugins.
5. A script that you can use to create a plugin library with the plugins you
  have created.
6. A script to add plugins to the wikis

If there is a new version of tiddlywiki available run `Setup.sh` again and it
will ask if you wish to update tiddlywiki or not, press `1` for yes or `2` for
no.

## Setup

1. Clone this repo using `git clone --recurse-submodules https://github.com/inmysocks/PluginDevelopment.git`
2. Go into the PluginDevelopment folder `cd PluginDevelopment`
2. Run `./Setup.sh`

## Using this

### Making a plugin

''Note:'' Making a plugin also makes a wiki that includes the new plugin, so
you can test the plugin without having to make anything new.

```
./MakePlugin.sh PluginName
```

To initialise a plugin run the script `MakePlugin.sh`, it will create a plugin
in the folder `./Plugins/PluginAuthor/PluginName`, where the author name is the
name given during setup and the plugin name is the name given to the command.

If for some reason you want to use a different author name for a plugin and
don't want to change the default name you can give the author name as the
second argument.

```
./MakePlugin.sh PluginName DifferentAuthorName
```

If you do this the plugin will be created in the folder `./Plugins/DifferentAuthorName/PluginName`.

This also creates a wiki that using the server edition that has your plugin as
a place where you can test and document it. The wiki is located in the folder
`./Wikis/PluginAuthor/PluginName`, to start the wiki run `./start PluginName`
and it will start the wiki server on the default port `8080`.

If you want to use a different port you can give it as the second argument like
this:

```
./start PluginAuthor/PluginName 8181
```

where you can change 8181 to whatever port you wish to use.

Remember that changes made to the plugin will not update in the wiki unless you
stop the server and restart it.

### Making a plugin library

To make a plugin library use the script `MakePluginLibrary.sh` which will
create the plugin library in the folder `./PluginLibrary/output`.

TODO add notes about how to host the plugin library.

Short version, if you have a webhost that can host static files you can just
copy the contents of the `PluginLibrary/output` folder into a folder on your
host and then the url for the library will be whatever the url for that folder
on your host is.

TODO add information about how to make a plugin library tiddler

### Making wikis

If you want to make a wiki without a plugin you can use the `./MakeWiki.sh`
script.

Typing

```
./MakeWiki.sh wikiName
```

will make a wiki is the `./Wikis/wikiName` folder using the empty edition.

If you want to use another edition you can give it as the second argument:

```
./MakeWiki.sh wikiName server
```

will make a wiki called `wikiName` using the `server` edition.

# Other Information

## The plugin library tiddlywiki.info file

The file `./PluginLibrary/tiddlywiki.info` is a normal tiddlywiki.info file
with the arguments in the build command to create a plugin library.

The filter

`[prefix[$:/]] -[prefix[$:/plugins/tiddlywiki/]] -[prefix[$:/themes/tiddlywiki/]] -[prefix[$:/languages/]]`

on line 29 determines which plugins are added to the plugin library created.
It adds everything other than the core plugins and any languages.
If you want to add languages using this you have to modify this filter to
either allow all languages or add on the language(s) individually.
