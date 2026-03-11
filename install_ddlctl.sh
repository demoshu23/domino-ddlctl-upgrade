#!/usr/bin/env bash
set -euo pipefail

DDLCTL_VERSION=${DDLCTL_VERSION:-"latest"}
INSTALL_DIR="/usr/local/bin"

echo "Installing ddlctl version: $DDLCTL_VERSION"

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Download
curl -L -o ddlctl.tar.gz \
  "https://downloads.dominodatalab.com/ddlctl/${DDLCTL_VERSION}/ddlctl-linux-amd64.tar.gz"

# Extract
tar -xzf ddlctl.tar.gz

# Install binary
chmod +x ddlctl
mv ddlctl $INSTALL_DIR/

# Verify
ddlctl version

echo "ddlctl installed successfully"