#!/bin/bash
set -euo pipefail

gem update --system --no-document
gem update --no-document
gem cleanup
gem outdated
