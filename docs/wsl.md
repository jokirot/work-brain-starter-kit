# Stufe C mit WSL2 — Linux-Kommandozeile auf dem Firmen-Windows

**Vorher:** IT fragen, ob WSL2 erlaubt ist (braucht einmalig Admin-Rechte).
**Trennung:** WSL ist Firmenumgebung — kein Tailscale, keine privaten Schlüssel, keine Verbindung zum Homeserver.

## 1. Installieren (PowerShell als Admin)
```powershell
wsl --install -d Ubuntu-24.04
```
Neu starten → Ubuntu öffnet sich → Linux-User + Passwort anlegen.
Aus dem Microsoft Store: **Windows Terminal** (meist schon da) → Standardprofil auf Ubuntu stellen.

## 2. Grundausstattung (in Ubuntu)
```bash
sudo apt update && sudo apt install -y git tmux ripgrep curl unzip
```
Firmen-Proxy/Zertifikate: falls `curl` an TLS scheitert → IT nach Proxy + Root-Zertifikat fragen
(typisch: `/usr/local/share/ca-certificates/` + `sudo update-ca-certificates`).

## 3. Starter-Kit einrichten
```bash
git clone https://github.com/jokirot/work-brain-starter-kit.git ~/starter-kit
bash ~/starter-kit/scripts/personalisiere.sh
```
Suche: `~/starter-kit/scripts/such.sh [begriff]` · Update: `git -C ~/starter-kit pull && bash ~/starter-kit/scripts/personalisiere.sh`

## 4. KI-Werkzeug in WSL
- **Claude Code**, falls erlaubt: `curl -fsSL https://claude.ai/install.sh | bash`
- **ChatGPT/Codex** (Firmen-Zugang): siehe [chatgpt.md](chatgpt.md) — Codex liest `AGENTS.md`.

## 5. Komfort
- **VS Code** (Windows) + Erweiterung „WSL" → `code .` in Ubuntu öffnet den Ordner.
- Windows-Dateien in WSL: `/mnt/c/Users/[name]/…` · WSL-Dateien in Windows: `\\wsl$\Ubuntu-24.04\home\[user]`
- Vault besser **in WSL** halten (`~/vault`, schnell); OneDrive-Ordner nur als Backup-Ziel.
- tmux wie gewohnt (`tmux new -A -s main`).

## Fallstricke
- Dateien unter `/mnt/c` sind langsam — Repos in `~` klonen.
- VPN der Firma kann WSL-Netz stören → `wsl --shutdown` hilft oft.

