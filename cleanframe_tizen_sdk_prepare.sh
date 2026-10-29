#!/usr/bin/env bash
set -euo pipefail
if [[ "$(uname -m)" != "x86_64" ]]; then echo "Requires x86_64 Linux"; exit 1; fi
mkdir -p "$HOME/.local/share/cleanframe/tizen-sdk-download"
cd "$HOME/.local/share/cleanframe/tizen-sdk-download"
url="https://download.tizen.org/sdk/Installer/tizen-sdk_10.0/web-cli_Tizen_SDK_10.0_ubuntu-64.bin"
file="web-cli_Tizen_SDK_10.0_ubuntu-64.bin"
echo "Downloading official Tizen SDK web CLI from: $url"
curl -fL --retry 3 --connect-timeout 20 "$url" -o "$file"
chmod u+x "$file"
echo "SHA256:"
sha256sum "$file"
echo "Displaying Samsung/Tizen license only. Installation not started."
./"$file" --show-license
