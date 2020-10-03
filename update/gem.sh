#!/bin/bash
set -euo pipefail

gem update --system
gem update
gem cleanup
gem outdated
