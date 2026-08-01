#!/usr/bin/env bash

if [ -f rom.zip ];then
  ./tools/rom.sh rom.zip out
else
  echo "not found rom"
  exit 1
fi

