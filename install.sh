#!/bin/bash
# OpenClaw Enhanced - Quick Install Script
# Clones repo and runs setup

set -e

REPO_URL="https://github.com/heyfinal/openclaw-enhanced.git"
INSTALL_DIR="$HOME/.openclaw-enhanced-installer"

echo "🦞 OpenClaw Enhanced - Quick Installer"
echo ""

# Clone repository
echo "Cloning repository..."
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
fi

git clone "$REPO_URL" "$INSTALL_DIR"

# Run setup
cd "$INSTALL_DIR"
chmod +x setup.sh
./setup.sh

# Cleanup
echo ""
echo "Cleaning up installer files..."
cd ~
rm -rf "$INSTALL_DIR"

echo ""
echo "✅ Installation complete!"
