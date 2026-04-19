#!/bin/bash
set -euo pipefail

gh extension upgrade --all
gh skills update
