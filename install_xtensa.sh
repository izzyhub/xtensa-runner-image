#!/bin/bash

curl -LO https://github.com/esp-rs/embuild/releases/latest/download/ldproxy-x86_64-unknown-linux-gnu.zip
unzip ldproxy-x86_64-unknown-linux-gnu.zip -d "$HOME/.cargo/bin"
chmod a+x "$HOME/.cargo/bin/ldproxy"
rustup set profile complete
curl -L https://github.com/esp-rs/espup/releases/latest/download/espup-x86_64-unknown-linux-gnu -o "$HOME/.cargo/bin/espup"
chmod a+x "$HOME/.cargo/bin/espup"
source "$HOME/.cargo/env"
"$HOME/.cargo/bin/espup" install -l debug --export-file $HOME/exports
touch $HOME/.bashrc
echo 'export RUSTFLAGS="-C instrument-coverage=all"'
echo "source $HOME/exports" >>$HOME/.bashrc
echo "$PATH" >>"$GITHUB_PATH"
#echo "$PATH" >> "$GITEA_PATH"
echo "LIBCLANG_PATH=${LIBCLANG_PATH}" >>"$GITHUB_ENV"
#echo "LIBCLANG_PATH=${LIBCLANG_PATH}" >> "$GITEA_ENV"
rustup default esp
rustup override unset
