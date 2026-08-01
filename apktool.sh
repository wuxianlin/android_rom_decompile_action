#!/usr/bin/env bash

if [ -d out/rom-deodexed ]; then
  ./tools/tools/apktool.sh out/rom-deodexed rom-decompiled-apktool
  find rom-decompiled-apktool -name classes*.dex | xargs -r rm
else
  echo "not found apk/jar folder"
  exit 1
fi

