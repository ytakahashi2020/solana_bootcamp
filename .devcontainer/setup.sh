#!/bin/bash

echo "Starting Solana development environment setup..."

# Install Solana CLI
echo "Installing Solana CLI..."
curl -sSfL https://release.solana.com/stable/install | sh

# Add Solana to PATH
echo "Configuring PATH..."
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Install Anchor
echo "Installing Anchor..."
cargo install --git https://github.com/coral-xyz/anchor avm --locked || true
$HOME/.cargo/bin/avm install latest || true
$HOME/.cargo/bin/avm use latest || true

# Verify installations
echo "Verifying installations..."
if command -v solana &> /dev/null; then
    echo "Solana version: $(solana --version)"
else
    echo "Warning: Solana CLI not found in PATH"
fi

if command -v anchor &> /dev/null; then
    echo "Anchor version: $(anchor --version)"
else
    echo "Warning: Anchor CLI not found in PATH"
fi

echo "Setup complete!"