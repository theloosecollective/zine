// Reusable square magazine-style page template.

#let page-size = 600pt

// Fixed geometry.
#let divider-x = 105pt
#let title-x = 122pt
#let title-y = 17pt
#let date-x = -26pt
#let date-y = 24pt
#let rules-y = 72pt
#let sidebar-x = 24pt
#let sidebar-y = 120pt
#let sidebar-width = 62pt
#let copy-x = 122pt
#let copy-y = 116pt
#let copy-width = page-size - copy-x - 26pt
#let copy-height = page-size - copy-y - 56pt
#let footer-x = -27pt
#let footer-y = -14pt

// Typography.
#let title-size = 18pt
#let header-size = 12pt
#let sidebar-size = 14pt
#let body-size = 12pt
#let footer-size = 14pt

#let title-track = 0.07em
#let body-track = 0em
#let quote-gap = 20pt

#let right-label(size, body, tracking: 0em, weight: "regular", style: "normal") = {
  set text(size: size, tracking: tracking, weight: weight, style: style)
  set par(justify: false)
  align(right, body)
}

#let article-copy(body, italic: false) = {
  set text(size: body-size, tracking: body-track, style: if italic { "italic" } else { "normal" })
  set par(justify: true, leading: 1.55em)
  body
}

#let page-furniture() = [
  #place(left + top, dy: rules-y, line(length: page-size, stroke: 1pt + black))
  #place(left + top, dy: rules-y + 5pt, line(length: page-size, stroke: 1pt + black))
  #place(
    left + top,
    dx: divider-x,
    line(
      start: (0pt, 0pt),
      end: (0pt, page-size),
      stroke: (paint: black, thickness: 1pt, dash: "dashed"),
    ),
  )
]

#let header(title, date) = [
  #place(
    left + top,
    dx: title-x,
    dy: title-y,
    block(
      width: 220pt,
      [
        #set text(size: title-size, tracking: title-track, weight: "bold")
        #set par(justify: false, leading: 1.02em)
        #title
      ],
    ),
  )
  #place(
    right + top,
    dx: date-x,
    dy: date-y,
    block(width: 110pt)[#right-label(header-size, date, tracking: 0.01em)],
  )
]

#let sidebar(title, section) = place(
  left + top,
  dx: sidebar-x,
  dy: sidebar-y,
  block(
    width: sidebar-width,
    [
      #right-label(sidebar-size, title, tracking: 0.01em, weight: "bold")
      #v(22pt)
      #right-label(sidebar-size, section, weight: "bold")
    ],
  ),
)

#let article-column(intro, quote: none) = place(
  left + top,
  dx: copy-x,
  dy: copy-y,
  block(
    width: copy-width,
    height: copy-height,
    clip: true,
    [
      #article-copy(intro)
      #if quote != none [
        #v(quote-gap)
        #article-copy(quote, italic: true)
      ]
    ],
  ),
)

#let footer(page-number) = place(
  right + bottom,
  dx: footer-x,
  dy: footer-y,
  block(width: 90pt)[#right-label(footer-size, [PAGE #page-number], tracking: 0.01em)],
)

#let magazine-page(
  title: [TURBOMACHINERY\ MAGAZINE],
  date: [1972-12-04],
  sidebar-title: [NEW\ RESEARCH\ IN\ TURBO\ MACHINERY],
  section: [Section\ 12.09],
  intro: [],
  quote: none,
  page-number: 28,
) = [
  #set page(
    width: page-size,
    height: page-size,
    margin: 0pt,
    fill: white,
  )
  #set text(
    font: "Berkeley Mono",
    fill: black,
    lang: "en",
  )
  #page-furniture()
  #header(title, date)
  #sidebar(sidebar-title, section)
  #article-column(intro, quote: quote)
  #footer(page-number)
]
