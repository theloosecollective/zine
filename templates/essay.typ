// Flowing essay environment with a few author-facing helpers.

#import "/templates/issue-state.typ": issue-date

#let page-size = 600pt

// Page geometry.
#let divider-x = 105pt
#let rules-y = 72pt
#let running-title-x = 122pt
#let running-title-y = 25pt
#let date-x = -26pt
#let date-y = 24pt
#let sidebar-x = 12pt
#let sidebar-width = 80pt
#let body-left = 122pt
#let body-top = 116pt
#let body-right = 26pt
#let body-bottom = 56pt
#let footer-x = -27pt
#let footer-y = -14pt

// Typography.
#let running-title-size = 12pt
#let running-title-track = 0.05em
#let sidebar-size = 11pt
#let body-size = 12pt
#let footer-size = 12pt

#let right-label(size, body, tracking: 0em, weight: "regular", style: "normal") = {
  set text(size: size, tracking: tracking, weight: weight, style: style)
  set par(justify: false)
  align(right, body)
}

#let essay-foreground(short-title) = context [
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

  #let (page,) = counter(page).get()

  #if page > 1 and short-title != [] [
    #place(
      left + top,
      dx: running-title-x,
      dy: running-title-y,
      block(width: 320pt)[
        #set text(size: running-title-size, tracking: running-title-track, weight: "bold")
        #set par(justify: false)
        #short-title
      ],
    )
  ]

  #place(
    right + top,
    dx: date-x,
    dy: date-y,
    block(width: 110pt)[
      #right-label(running-title-size, issue-date.get(), tracking: 0.01em)
    ],
  )

  #place(
    right + bottom,
    dx: footer-x,
    dy: footer-y,
    block(width: 90pt)[
      #right-label(footer-size, [PAGE #page], tracking: 0.01em)
    ],
  )
]

#let essay(short-title: [], body) = [
  #set page(
    width: page-size,
    height: page-size,
    margin: (
      top: body-top,
      right: body-right,
      bottom: body-bottom,
      left: body-left,
    ),
    fill: white,
    foreground: essay-foreground(short-title),
  )
  #set text(
    font: "Berkeley Mono",
    size: body-size,
    tracking: 0em,
    fill: black,
    lang: "en",
  )
  #set par(justify: true, leading: 1.55em)
  #body
]

#let page-title(title, deck: none) = block(
  below: 40pt,
  [
    #set text(size: 28pt, tracking: 0.04em, weight: "bold")
    #set par(justify: false, leading: 0.98em)
    #title

    #if deck != none [
      #v(10pt)
      #set text(size: 13pt, weight: "regular", style: "italic")
      #set par(justify: false, leading: 1.35em)
      #deck
    ]
  ],
)

#let sidebar(body) = place(
  left,
  dx: sidebar-x - body-left,
  block(
    width: sidebar-width,
    [
      #set text(size: sidebar-size, tracking: 0em, weight: "bold")
      #set par(justify: false, leading: 1.35em)
      #align(right, body)
    ],
  ),
)
