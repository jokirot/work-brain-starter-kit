// Allgemeines Dokument: Bericht, Konzept, Memo, Spec. Neutral, Logo/Farbe optional.
// Nutzung:
//   #import "typst/dokument.typ": dokument
//   #show: dokument.with(titel: "...", untertitel: "...", autor: "__NAME__", status: "Entwurf")

#let dokument(
  titel: "",
  untertitel: none,
  autor: "__NAME__",
  datum: datetime.today().display("[day].[month].[year]"),
  status: none,
  akzent: rgb("#1f4e79"),
  logo: none,
  lang: "de",
  inhaltsverzeichnis: false,
  body,
) = {
  set document(title: titel, author: autor)
  set page(paper: "a4", margin: (x: 22mm, top: 25mm, bottom: 22mm),
    header: context if counter(page).get().first() > 1 {
      text(8pt, fill: gray.darken(20%))[#titel #h(1fr) #datum]
    },
    footer: context align(right, text(8pt, fill: gray.darken(20%),
      counter(page).display("1 / 1", both: true))))
  set text(font: ("Segoe UI", "Arial", "Helvetica Neue"), size: 10.5pt, lang: lang)
  set par(justify: false, leading: 0.6em, spacing: 0.9em)
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => { v(1em); text(14pt, fill: akzent, it); v(0.3em) }
  show heading.where(level: 2): it => { v(0.6em); text(11.5pt, fill: akzent, it) }
  set table(stroke: 0.5pt + gray, inset: 5pt)
  show table.cell.where(y: 0): set text(weight: "bold")
  show link: set text(fill: akzent)

  if logo != none { align(right, logo) }
  text(20pt, weight: "bold")[#titel]
  if untertitel != none { linebreak(); text(12pt, fill: akzent)[#untertitel] }
  v(0.2em)
  text(9pt, fill: gray.darken(30%))[#autor · #datum#if status != none [ · #status]]
  line(length: 100%, stroke: 0.6pt + akzent)
  if inhaltsverzeichnis { outline(indent: auto); v(1em) }
  body
}
