#!/usr/bin/env sh

find mods -maxdepth 1 -type f -name '*.jar' -not -name '*.hidden.jar' | sort > mods.txt
