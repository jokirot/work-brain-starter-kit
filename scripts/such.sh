#!/usr/bin/env bash
# Suche über den Work-Brain (Linux/macOS).  such.sh <begriff> [brain-pfad]
[ -f "$HOME/.config/work-brain.env" ] && . "$HOME/.config/work-brain.env"
B="${2:-${BRAIN:-$HOME/vault}}"
rg -i -n --glob '*.md' -C1 -- "$1" "$B" 2>/dev/null || grep -rni --include='*.md' -- "$1" "$B"
