#!/bin/sh

for f in $(find -s "$HOME/.config/bash" -type f -perm +111); do
  . "$f"
done
