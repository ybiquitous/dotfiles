#!/bin/bash
set -euo pipefail

npm -g install npm
npm -g update
npm -g outdated || echo '' # ignore exit code
