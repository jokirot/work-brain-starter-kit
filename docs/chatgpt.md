# ChatGPT (Firmen-Zugang) mit meiner Methode nutzen

Das Kit ist werkzeug-neutral — ChatGPT ist nur ein anderer Motor. Vier Hebel, vom einfachsten an:

| # | Hebel | Was | Ersetzt bei Claude |
|---|---|---|---|
| 1 | **Individuelle Hinweise** | [custom-instructions.md](../chatgpt/custom-instructions.md) einfügen | globale `CLAUDE.md` |
| 2 | **Projekte** | Je Arbeitsthema ein ChatGPT-Projekt; Anweisung = Projekt-Kontext, Dateien = relevante Vault-Notizen (`KONZEPT.md`, `_status-modell.md`, Themen-Datei) | Projekt-`CLAUDE.md` + Kontext |
| 3 | **Eigene GPTs** | „Work-Brain"-GPT mit den Kurzbefehlen + Status-Modell als Wissen; im Team teilbar | Skills / Slash-Commands |
| 4 | **Codex** (CLI in WSL, IDE-Erweiterung) | Agent im Terminal/Repo wie Claude Code; liest **`AGENTS.md`** | Claude Code |

## Codex einrichten (falls im Abo enthalten und von der IT erlaubt)
```bash
npm i -g @openai/codex        # Node via mise/nvm in WSL
codex                          # Login mit dem Firmen-ChatGPT-Konto
```
- Codex liest `AGENTS.md` im Repo (und global `~/.codex/AGENTS.md`). → Inhalt von `claude/CLAUDE.md`
  dorthin kopieren: `cp ~/starter-kit/claude/CLAUDE.md ~/.codex/AGENTS.md`
- Wiederkehrende Befehle (idee, dokumentiere, konsolidiere …) als Codex-Prompts/Skills anlegen —
  Format je nach Codex-Version prüfen (`codex --help`, Doku). Die Texte aus `claude/commands/` passen inhaltlich 1:1.

## Was nicht geht / Unterschiede
- Kein Dateizugriff im Web-Chat → Ergebnisse als Markdown kopieren; Codex/IDE schreibt direkt.
- Memory von ChatGPT ist bequem, aber nicht dein Vault — **Wahrheit bleibt der Vault**.
- Firmendaten nur in den Firmen-Zugang, nie in private Konten.
