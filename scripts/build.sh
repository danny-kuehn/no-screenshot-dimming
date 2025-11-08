#!/usr/bin/env bash

set -e

cd "$(cd "$(dirname "$0")" && pwd)/.."

echo >&2 "Packing extension..."

gnome-extensions pack src --force --extra-source="../LICENSE"

echo >&2 "Packed."

while getopts i flag; do
  case $flag in
    i)
      echo >&2 "Installing extension..."

      gnome-extensions install --force \
        no-screenshot-dimming@danny-kuehn-on-github.shell-extension.zip

      echo >&2 "Installed. Reload GNOME Shell."
      ;;
    *)
      echo >&2 "Usage: $0 [-i]"
      echo >&2 "  -i   Install after building"
      exit 1
      ;;
  esac
done
