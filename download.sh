#!/usr/bin/env bash

if [ -z "$ROM_URL" ]; then
  echo "no rom url"
  exit 1
fi

axel -q -n 10 -o rom.zip $ROM_URL

