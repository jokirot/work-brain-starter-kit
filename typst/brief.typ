// Brief nach DIN 5008 (Form B). Neutral — Absender/Logo pro Aufruf übergeben.
// Nutzung:
//   #import "typst/brief.typ": brief   (bzw. relativ mit --root)
//   #show: brief.with(absender: (...), empfaenger: (...), betreff: "...", datum: "...")

#let brief(
  absender: ("__NAME__", "__FIRMA__", ""),
  empfaenger: (),
  betreff: "",
  datum: datetime.today().display("[day].[month].[year]"),
  ort: "",
  gruss: "Mit freundlichen Grüßen",
  unterschrift: "",
  logo: none,
  lang: "de",
  body,
) = {
  set document(title: betreff, author: absender.at(0))
  set page(paper: "a4", margin: (left: 25mm, right: 20mm, top: 27mm, bottom: 25mm))
  set text(font: ("Segoe UI", "Arial", "Helvetica Neue"), size: 10.5pt, lang: lang)
  set par(leading: 0.6em, spacing: 1.1em)

  // Kopf: Absender rechts, optional Logo
  grid(columns: (1fr, auto),
    if logo != none { logo } else { [] },
    align(right, text(9pt, absender.join("\n"))))

  // Anschriftfeld (DIN 5008 B: 45 mm von oben)
  place(top + left, dy: 45mm - 27mm, block(width: 85mm, height: 45mm)[
    #text(7pt, fill: gray.darken(30%), absender.join(" · "))
    #v(2mm)
    #empfaenger.join("\n")
  ])
  v(45mm + 45mm - 27mm - 1em)

  align(right, if ort != "" [#ort, #datum] else [#datum])
  v(1.2em)
  text(weight: "bold", betreff)
  v(1em)
  body
  v(1em)
  gruss
  v(2.5em)
  unterschrift
}
