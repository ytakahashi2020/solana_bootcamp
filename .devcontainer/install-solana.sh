#!/bin/bash

echo "=== Installing Solana CLI ==="

# Solana CLIのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.solana.com | sh -s - stable

# PATHの設定
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> $HOME/.profile

# 現在のセッションでPATHを有効化
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# 確認
echo "=== Checking Solana installation ==="
$HOME/.local/share/solana/install/active_release/bin/solana --version

echo "=== Installation complete ==="