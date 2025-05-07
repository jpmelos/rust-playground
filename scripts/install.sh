#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SCRIPT="${SCRIPT_DIR}/pgrs.sh"

mkdir -p ~/bin
ln -sf "${SOURCE_SCRIPT}" ~/bin/pgrs

echo "Installed pgrs command to ~/bin/pgrs"
echo "Make sure ~/bin is in your PATH"
