#!/usr/bin/env bash

if [ -d out/rom-deodexed ]; then
  ./tools/tools/jadx.sh out/rom-deodexed rom-decompiled-jadx
  find rom-decompiled-jadx -name classes*.dex | xargs -r rm
else
  echo "not found apk/jar folder"
  exit 1
fi

