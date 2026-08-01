#!/usr/bin/env bash

if [ -z "$ROM_URL" ]; then
  echo "no rom url"
	exit 1
fi

axel -n 10 -o rom.zip $ROM_URL

./tools/rom.sh rom.zip out

rm -r out/rom

./tools/tools/jadx.sh out/rom-deodexed rom-decompiled-jadx

find rom-decompiled-jadx -name classes*.dex | xargs -r rm

