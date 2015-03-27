# dev-node-module
Replaces a node module for development purposes

## Usage

```
./dev-node-module/replace.sh [package] [module] [prefix]
```

Package - the git repo name of the npm package

Module - the node_module to replace found in the package.

Prefix - [optional] The development node module prefix folder name.

Example:

```
    ./dev-node-module/replace.sh pal-server trinity cnn
```

This replaces the node module called trinity in the package pal-server
with a folder called cnn-trinity that is at the same directory level as
the pal-server package. Also the dev-node-module folder must be at the
same level as the package and target development module.

To restore back to the original module that was being used run the same
command again:

```
    ./dev-node-module/replace.sh pal-server trinity cnn
```
