# Verdaccio offline NPM cache adapted for offline prison use

## Changes from parent verdaccio

The main intent of those changes is to allow setting up verdaccio 
to never attempt to update a package from a downstream repository. 
This is useful to setup a verdaccio repository, located online,
that will nevertheless work exactly the way that an offline version of the same repository would work.

The changes are in this file, which is copied locally into this repository:
https://github.com/verdaccio/verdaccio/raw/v3.2.0/src/lib/storage.js

The modified version of this file is storage.modified.js
