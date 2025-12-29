#!/bin/bash

echo "=== Installing Solana CLI ==="

# 一時的にDNSを設定
echo "Testing network connectivity..."
ping -c 1 google.com || echo "Network may be limited"

# wgetを試す
if command -v wget &> /dev/null; then
    echo "Using wget to download Solana installer..."
    wget -O - https://release.solana.com/stable/install | sh
else
    echo "Using curl to download Solana installer..."
    curl -fsSL https://release.solana.com/stable/install | sh
fi

# PATHの設定
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> $HOME/.profile
source $HOME/.bashrc

# 確認
echo "=== Checking Solana installation ==="
if [ -f "$HOME/.local/share/solana/install/active_release/bin/solana" ]; then
    $HOME/.local/share/solana/install/active_release/bin/solana --version
else
    echo "Error: Solana CLI installation failed"
    echo "Please check your network connection and try again"
fi

echo "=== Installation complete ==="