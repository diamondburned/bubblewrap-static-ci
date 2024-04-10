# bubblewrap-static-ci

Nix CI that automatically builds Bubblewrap statically using muslc.

## Why?

The Engineering and Computer Science Department of California State University,
Fullerton sucks and cannot be trusted with providing students a working pubnix.

Also, their servers don't have root and cannot run Nix, so this exists to
provide students with an actually useful usable environment.

Bubblewrap binaries built with this repository should automatically work on any
environment because they are statically linked. There should be no libc
dependencies.

## Usage

Go to the [latest release](https://github.com/diamondburned/bubblewrap-static-ci/releases/latest)
and download the latest binary matching your architecture. The `bwrap` binary
will be in `./bin/bwrap`.

## Updates

This repository automatically updates the Bubblewrap version to the latest
version provided in Nixpkgs. The commit hash for this is provided in the
release notes.
