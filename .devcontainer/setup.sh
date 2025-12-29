#!/bin/bash
set -e

echo "Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

echo "Adding Solana to PATH..."
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

echo "Installing Anchor via AVM..."
cargo install --git https://github.com/coral-xyz/anchor avm --locked
~/.cargo/bin/avm install latest
~/.cargo/bin/avm use latest

echo "Setup complete!"
solana --version
anchor --version