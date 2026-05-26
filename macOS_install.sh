#!/bin/bash
# bosectl macOS Installer

set -e

echo "=== bosectl macOS Installer ==="
echo ""

# 1. Install dependencies
echo "Installing macOS Bluetooth dependencies (PyObjC)..."
python3 -m pip install --user pyobjc-core==9.2 pyobjc-framework-Cocoa==9.2 pyobjc-framework-IOBluetooth==9.2

# 2. Make bosectl script executable
echo "Configuring executable permissions..."
chmod +x bosectl

# 3. Create symlink in /usr/local/bin
echo ""
echo "To make 'bosectl' accessible from anywhere on your system,"
echo "we will create a symlink in /usr/local/bin/bosectl."
echo "This requires administrator privileges."
echo ""

if sudo ln -sf "$(pwd)/bosectl" /usr/local/bin/bosectl; then
    echo ""
    echo "=== Installation Successful! ==="
    echo "You can now run 'bosectl' from any terminal session."
else
    echo ""
    echo "=== Symlink Failed ==="
    echo "Could not create symlink in /usr/local/bin."
    echo "You can still run it locally using: $(pwd)/bosectl"
fi
