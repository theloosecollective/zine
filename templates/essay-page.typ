// Flowing interior page template.

#import "/templates/issue-state.typ": issue-date

#let page-size = 600pt

// Fixed geometry.
#let divider-x = 105pt
#let title-x = 122pt
#let title-y = 17pt
#let date-x = -26pt
#let date-y = 24pt
#let rules-y = 72pt
#let sidebar-x = 12pt
#let sidebar-y = 120pt
#let sidebar-width = 80pt
#let copy-x = 122pt
#let copy-y = 116pt
#let copy-right = 26pt
#let copy-bottom = 56pt
#let footer-x = -27pt
#let footer-y = -14pt

// Typography.
#let title-size = 18pt
#let header-size = 12pt
#let sidebar-title-size = 11pt
#let sidebar-section-size = 13pt
#let body-size = 12pt
#let footer-size = 14pt

#let title-track = 0.07em
#let body-track = 0em

#let right-label(size, body, tracking: 0em, weight: "regular", style: "normal") = {
  set text(size: size, tracking: tracking, weight: weight, style: style)
  set par(justify: false)
  align(right, body)
}

#let essay-foreground(title, sidebar-title, section) = context [
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
    block(width: 110pt)[
      #right-label(header-size, issue-date.get(), tracking: 0.01em)
    ],
  )

  #place(
    left + top,
    dx: sidebar-x,
    dy: sidebar-y,
    block(
      width: sidebar-width,
      [
        #right-label(sidebar-title-size, sidebar-title, tracking: 0em, weight: "bold")
        #v(22pt)
        #right-label(sidebar-section-size, section, weight: "bold")
      ],
    ),
  )

  #place(
    right + bottom,
    dx: footer-x,
    dy: footer-y,
    block(width: 90pt)[
      #let (page,) = counter(page).get()
      #right-label(footer-size, [PAGE #page], tracking: 0.01em)
    ],
  )
]

#let essay-page(
  title: [TURBOMACHINERY\ MAGAZINE],
  sidebar-title: [NEW\ RESEARCH\ IN\ TURBO\ MACHINERY],
  section: [Section\ 12.09],
  body: [],
) = [
  #set page(
    width: page-size,
    height: page-size,
    margin: (
      top: copy-y,
      right: copy-right,
      bottom: copy-bottom,
      left: copy-x,
    ),
    fill: white,
    foreground: essay-foreground(title, sidebar-title, section),
  )
  #set text(
    font: "Berkeley Mono",
    size: body-size,
    tracking: body-track,
    fill: black,
    lang: "en",
  )
  #set par(justify: true, leading: 1.55em)
  #body
]
