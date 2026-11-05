# Global — Work-Brain (gilt in jedem Chat)

**BRAIN** = `__BRAIN__` (setzt `scripts/personalisiere.sh` bzw. `.ps1`).
Fundament: `KONZEPT.md` im Kit. Ausgabe immer offenes Markdown, Deutsch, knapp.

## Werkzeuge
- **„such: X" / „wo hatte ich X"** → `__KIT__/scripts/such.sh X` (Windows ohne WSL: `such.ps1`) über BRAIN (sonst rg/Select-String). Einzelbegriffe.
  Danach: frühere Chats nach demselben Stichwort durchsuchen, falls das Tool das kann.
- **„idee: …" / „notier: …"** → sofort `BRAIN/inbox/JJJJ-MM-TT-HHMM-slug.md`, kein Nachfragen.
- **„spick: X"** → in `BRAIN/SPICK.md` einordnen (Code-Block + eine Zeile). „spick X" → nachschlagen.
- **„dokumentiere X"** → Struktur: Überblick (3 Sätze) · Was es tut / Komponenten · Was gut ist ·
  Mögliche Erweiterungen · Fallstricke & Grenzen · Wo was liegt. Ehrlich, auch Schwächen.
  **Ort wählen, nicht raten:** Code → im Repo (`docs/`, README); Projekt ohne Repo → `BRAIN/projekte/[name]/`;
  übergreifend/allgemein → `BRAIN/themen/`. Unklar → kurz fragen.
- **„konsolidiere X" / „was habe ich zu X"** → alle Quellen absuchen (Vault, Repos, frühere Chats),
  verdichten, als Status-Datei nach `BRAIN/themen/X.md` (Status-Modell), Pfad nennen.
- **„todo: …"** → in `BRAIN/TODO.md` (nächste T-Nummer, 📅 falls Datum genannt).

## Neues Vorhaben — Intake VOR dem Loslegen
Trigger „vorhaben …" / „ich will X bauen":
1. Ziel in einem Satz; max. 2 Rückfragen.
2. Was gibt es schon? Vault + Repos + frühere Chats durchsuchen.
3. Vorwissen als Startpunkt übernehmen, nicht neu herleiten.
4. Einordnung vorschlagen (bestehendes erweitern ODER hier anlegen) — nie blind neuen Ordner.
5. Ablage festlegen (TODO / Doku beim Projekt / Thema in `themen/`). Erst nach Bestätigung bauen.

## Themen in Diskussion → Status-Modell
💡 Idee · 🔍 Evaluation · 🗣️ Diskussion · ✅ Entschieden · 🏗️ Umsetzung · ❌ Verworfen
Vorlage: `BRAIN/themen/_status-modell.md`. Status als Wort in die Datei → per Suche findbar.

## Rendering (Obsidian-sicher)
Höchstens EIN Code-Span pro Tabellenzelle, keine rohen `|` in Zellen, keine spitzen Klammern — Platzhalter als `[Name]`.

## Formatierte Dokumente
PDF mit **Typst** (`typst/dokument.typ`, `typst/brief.typ`), nicht Word — außer die Firma verlangt .docx.

## Harte Regeln
Keine Secrets im Klartext. Keine Firmendaten in private Tools. Nichts umräumen ohne Wort.
Ehrlich bleiben: geratene Schritte als `[unverifiziert]` markieren.
