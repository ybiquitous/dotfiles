#!/bin/bash
set -euo pipefail

echo "Installing/updating skills globally..."
skills add googlechrome/modern-web-guidance --skill modern-web-guidance --agent '*' --global --yes

echo
echo "Showing installed skills..."
echo
skills ls --global
