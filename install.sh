#!/bin/bash
# Install compact-cachyos-conky
set -euo pipefail

CONKY_DST="${HOME}/.config/conky/conky.conf"
BIN_DST="${HOME}/.local/bin"

echo "→ Installing conky config to ${CONKY_DST}"
cp conky.conf "${CONKY_DST}"

echo "→ Installing helper scripts to ${BIN_DST}/"
cp gpu-util zram-stats "${BIN_DST}/"
chmod +x "${BIN_DST}/gpu-util" "${BIN_DST}/zram-stats"

echo "✓ Done. Start with: conky -c ${CONKY_DST} -d"
