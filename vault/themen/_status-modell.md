---
type: konvention
title: Status-Modell für Themen & Architektur-Diskussion
updated: 2026-07-23
---

# So diskutieren wir Themen & Architektur — Status, Optionen, Plan

Damit man jederzeit sieht **was ist nur eine Idee, was wird evaluiert, was ist entschieden,
was ist der Plan** — und damit ein neuer Chat den Reifegrad sofort erkennt. Jedes Thema =
**eine Datei** mit einem Status-Kopf. Der Status steht als Wort in der Datei → per `such:`
findest du alle Themen eines Reifegrads quer über alles.

## Die sechs Zustände

| Status | Bedeutung |
|---|---|
| 💡 **Idee** | roher Einfall, noch nicht durchdacht |
| 🔍 **Evaluation** | wird geprüft/recherchiert, Optionen werden gesammelt |
| 🗣️ **Diskussion** | Optionen stehen, wir wägen ab / holen Meinungen ein |
| ✅ **Entschieden** | Richtung steht (mit Datum + Begründung) |
| 🏗️ **Umsetzung** | wird gebaut |
| ❌ **Verworfen** | bewusst nicht weiterverfolgt (mit Grund — damit es nicht wiederkommt) |

## Vorlage (kopieren pro Thema)

```markdown
# [Thema]
Status: 🔍 Evaluation · zuletzt: JJJJ-MM-TT · Owner: [wer]

## Frage / Ziel
Was wollen wir entscheiden oder erreichen? (2–3 Sätze)

## Optionen
| # | Option | Pro | Contra | Aufwand |
|---|--------|-----|--------|---------|
| A | …      | …   | …      | …       |
| B | …      | …   | …      | …       |

## Diskussionsstand / offene Punkte
- was noch unklar ist, wer noch gefragt werden muss

## Entscheidung
(leer bis ✅ — dann: was, Datum, Begründung)

## Plan / nächster Schritt
- eine konkrete Handlung

## Quellen
- Notiz/Doku · Chat („welcher chat: X") · Repo · Mail · Anforderung
```

## Wo ein Thema liegt — EIN Ort

**Immer:** `themen/[thema].md`. Ein einziger Ort für alle Status-/
Diskussionsdateien, damit nichts verstreut liegt („wo hab ich's hingelegt"-Falle). Detail-/
Konzeptnotizen bleiben beim Projekt (`projekte/<name>/`) oder im Repo und werden von hier nur
*verlinkt* — nicht dupliziert.

Der Status-Kopf ist überall gleich → `such: Evaluation` / `such: Diskussion` macht alle offenen
Themen sichtbar. Entschiedenes bleibt stehen (nicht löschen), nur der Status wandert auf
✅/🏗️/❌ — so ist die Historie erhalten.
