#!/bin/bash
set -euo pipefail

echo "Updating skills globally..."
skills update --global --yes

echo
echo "Showing installed skills..."
echo
skills ls --global
