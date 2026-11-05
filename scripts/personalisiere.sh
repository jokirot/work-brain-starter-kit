#!/usr/bin/env bash
# Personalisiert das Kit nach dem Klonen (Linux / WSL / macOS). Mehrfach ausführbar.
#   bash scripts/personalisiere.sh
# Schreibt NUR außerhalb des Kits (Kit bleibt sauber → git pull ohne Konflikte):
#   ~/.claude/CLAUDE.md + commands · ~/.codex/AGENTS.md · BRAIN (Vault, falls neu) · BRAIN/_vorlagen (Typst)
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
CONF="$HOME/.config/work-brain.env"
[ -f "$CONF" ] && . "$CONF"
ask(){ local v="$1" p="$2" d="$3"; read -r -p "$p [${!v:-$d}]: " a; printf -v "$v" '%s' "${a:-${!v:-$d}}"; }
ask NAME  "Dein Name"            ""
ask FIRMA "Firma"                ""
ask BRAIN "Pfad zum Vault"       "$HOME/vault"
BRAIN="${BRAIN/#\~/$HOME}"
mkdir -p "$(dirname "$CONF")"
printf 'NAME=%q\nFIRMA=%q\nBRAIN=%q\n' "$NAME" "$FIRMA" "$BRAIN" > "$CONF"

sub(){ sed -e "s#__NAME__#${NAME//#/\\#}#g" -e "s#__FIRMA__#${FIRMA//#/\\#}#g" \
           -e "s#__BRAIN__#${BRAIN//#/\\#}#g" -e "s#__KIT__#${KIT//#/\\#}#g" "$1"; }

# Vault nur anlegen, nie überschreiben
if [ ! -d "$BRAIN" ]; then cp -r "$KIT/vault" "$BRAIN"; (cd "$BRAIN" && git init -q) || true; echo "Vault angelegt: $BRAIN"
else echo "Vault existiert, unverändert: $BRAIN"; fi

# Claude Code
mkdir -p "$HOME/.claude/commands"
[ -f "$HOME/.claude/CLAUDE.md" ] && ! grep -q 'Work-Brain' "$HOME/.claude/CLAUDE.md" && cp "$HOME/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md.bak"
sub "$KIT/claude/CLAUDE.md" > "$HOME/.claude/CLAUDE.md"
for f in "$KIT"/claude/commands/*.md; do sub "$f" > "$HOME/.claude/commands/$(basename "$f")"; done
# Codex (liest AGENTS.md)
mkdir -p "$HOME/.codex"; sub "$KIT/claude/CLAUDE.md" > "$HOME/.codex/AGENTS.md"
# Typst-Vorlagen
mkdir -p "$BRAIN/_vorlagen"; for f in "$KIT"/typst/*.typ; do sub "$f" > "$BRAIN/_vorlagen/$(basename "$f")"; done
# ChatGPT-Hinweise zum Kopieren
sub "$KIT/chatgpt/custom-instructions.md" > "$BRAIN/_vorlagen/chatgpt-hinweise.md"

echo "Fertig. Einstellungen: $CONF  ·  ChatGPT-Text: $BRAIN/_vorlagen/chatgpt-hinweise.md"
