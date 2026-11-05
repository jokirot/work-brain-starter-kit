# Work-Brain Starter-Kit

Meine Arbeitsmethode — **ohne Inhalte**. Reines Markdown + ein paar Prompts.
Läuft in drei Stufen, je nachdem, was die Firmen-IT erlaubt.

## Stufe A — Minimal (nur Browser + Ordner, nichts installieren)
1. Ordner `vault/` nach OneDrive/SharePoint kopieren (z. B. `OneDrive - [Firma]\work-brain`).
2. Im freigegebenen KI-Tool (Claude/Copilot/ChatGPT Enterprise) den Inhalt von
   `claude/CLAUDE.md` (bzw. `chatgpt/custom-instructions.md`) als **Custom Instructions / Projekt-Anweisung** hinterlegen.
3. Die Befehle aus `claude/commands/` als gespeicherte Prompts nutzen (Copy-Paste).

## Stufe B — Editor erlaubt (VS Code oder Obsidian portable)
- `vault/` als Obsidian-Vault bzw. VS-Code-Ordner öffnen. `HOME.md` = Startseite.
- Suche: `scripts/such.ps1 <begriff>` (nutzt `rg` falls da, sonst `Select-String`).

## Stufe C — Claude Code / Codex (WSL, Linux, Mac oder Windows)
```bash
git clone https://github.com/jokirot/work-brain-starter-kit.git ~/starter-kit
bash ~/starter-kit/scripts/personalisiere.sh        # fragt Name, Firma, Vault-Pfad
```
Windows ohne WSL: `powershell -ExecutionPolicy Bypass -File scripts\personalisiere.ps1`

Das Skript schreibt nur **außerhalb** des Kits (`~/.claude`, `~/.codex/AGENTS.md`, Vault, `Vault/_vorlagen`) —
das Kit bleibt sauber, `git pull` + Skript erneut = Update. Einstellungen merkt es sich in `~/.config/work-brain.env`.
Danach gelten: `/idee`, `/vorhaben`, `/dokumentiere`, `/konsolidiere`, `/such`, `/spick`, `/weekly`, `/struktur`, `/todo`, `/rat`.

## Anleitungen
- [docs/wsl.md](docs/wsl.md) — Linux-Kommandozeile (WSL2) auf Windows
- [docs/chatgpt.md](docs/chatgpt.md) — Methode mit ChatGPT/Codex (Firmen-Zugang)

## Vor dem Start mit der IT klären
- Welche KI-Tools/Accounts sind erlaubt (Firmen-Abo)? Dürfen Firmendaten rein?
- Admin-Rechte / WSL / winget? Git + GitHub (Enterprise)? Welcher Cloud-Speicher?

## Eiserne Regeln
- **Keine Firmendaten in private Tools/Accounts, keine privaten Daten auf den Firmenrechner.**
- Dieses Kit enthält nur Methode, nie Inhalte — so darf es zwischen den Welten wandern.

Fundament: [KONZEPT.md](KONZEPT.md)
