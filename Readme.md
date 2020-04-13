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

## Setup

1. Clone this repo
2. Run `Setup.sh`

## Using this

To use this you first run `MakePlugin.sh` to create an empty plugin, then you
edit the plugin to do whatever it is you want it to do, then you run
`MakePluginLibrary.sh` which will create the plugin library in the folder
`./PluginLibrary/output`.


# Other Information

## The plugin library tiddlywiki.info file

The file `./PluginLibrary/tiddlywiki.info` is a normal tiddlywiki.info file
with the arguments in the build command to create a plugin library.
