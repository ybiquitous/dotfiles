#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"
readonly SOURCE_DIR="${BASEDIR}/HOME/.config/opencode"
readonly TARGET_DIR="${HOME}/.config/opencode"

mkdir -pv "${TARGET_DIR}"

link_file() {
  local source_file="$1"
  local target_file

  target_file="${TARGET_DIR}/$(basename "${source_file}")"

  if [[ -f "${target_file}" && ! -L "${target_file}" ]]; then
    printf "(backup) "
    mv -vf "${target_file}" "${target_file}.bak"
  fi

  ln -svf "${source_file}" "${target_file}"
}

link_file "${BASEDIR}/AGENTS.md"

find "${SOURCE_DIR}" -maxdepth 1 -type f | while IFS= read -r file; do
  link_file "${file}"
done
