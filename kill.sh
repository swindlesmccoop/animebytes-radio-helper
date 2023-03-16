#!/bin/sh
cat "$HOME/.abrpid" | xargs kill
rm "$HOME/.abrpid"
