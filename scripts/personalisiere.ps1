# Personalisiert das Kit nach dem Klonen (Windows ohne WSL). Mehrfach ausführbar.
#   powershell -ExecutionPolicy Bypass -File scripts\personalisiere.ps1
$Kit  = Split-Path $PSScriptRoot -Parent
$Name  = Read-Host "Dein Name"
$Firma = Read-Host "Firma"
$Def   = "$env:USERPROFILE\OneDrive - $Firma\work-brain"
$Brain = Read-Host "Pfad zum Vault [$Def]"; if (-not $Brain) { $Brain = $Def }
function Sub($p) { (Get-Content $p -Raw -Encoding UTF8) -replace '__NAME__',$Name -replace '__FIRMA__',$Firma `
  -replace '__BRAIN__',$Brain.Replace('$','$$') -replace '__KIT__',$Kit }
if (-not (Test-Path $Brain)) { Copy-Item "$Kit\vault" $Brain -Recurse; "Vault angelegt: $Brain" } else { "Vault existiert, unverändert: $Brain" }
$C = "$env:USERPROFILE\.claude"; New-Item -ItemType Directory -Force "$C\commands","$env:USERPROFILE\.codex","$Brain\_vorlagen" | Out-Null
Sub "$Kit\claude\CLAUDE.md" | Set-Content "$C\CLAUDE.md" -Encoding UTF8
Sub "$Kit\claude\CLAUDE.md" | Set-Content "$env:USERPROFILE\.codex\AGENTS.md" -Encoding UTF8
Get-ChildItem "$Kit\claude\commands\*.md" | ForEach-Object { Sub $_.FullName | Set-Content "$C\commands\$($_.Name)" -Encoding UTF8 }
Get-ChildItem "$Kit\typst\*.typ" | ForEach-Object { Sub $_.FullName | Set-Content "$Brain\_vorlagen\$($_.Name)" -Encoding UTF8 }
Sub "$Kit\chatgpt\custom-instructions.md" | Set-Content "$Brain\_vorlagen\chatgpt-hinweise.md" -Encoding UTF8
"Fertig. ChatGPT-Text: $Brain\_vorlagen\chatgpt-hinweise.md"
