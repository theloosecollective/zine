// Flowing essay environment. Authors should mostly write plain Typst prose.

#import "/templates/geometry.typ": *
// Typography.
#let running-title-size = 12pt
#let running-title-track = 0.05em
#let body-size = 11.5pt
#let footer-size = 12pt

#let label(size, body, tracking: 0em, weight: "regular", style: "normal") = {
  set text(size: size, tracking: tracking, weight: weight, style: style)
  set par(justify: false)
  body
}

#let essay-foreground(short-title) = context [
  #place(left + top, dy: essay-rules-y, line(length: page-width, stroke: 1pt + black))
  #place(left + top, dy: essay-rules-y + 5pt, line(length: page-width, stroke: 1pt + black))
  #place(
    left + top,
    dx: essay-divider-x,
    line(
      start: (0pt, 0pt),
      end: (0pt, page-height),
      stroke: (paint: black, thickness: 1pt, dash: "dashed"),
    ),
  )

  #let (page,) = counter(page).get()

  #if page > 1 and short-title != [] [
    #place(
      left + top,
      dx: essay-body-left,
      block(width: essay-running-title-width, height: essay-header-height)[
        #align(left + horizon, [
          #label(running-title-size, short-title, tracking: running-title-track, weight: "bold")
        ])
      ],
    )
  ]

  #place(
    right + bottom,
    dx: -essay-outer-inset,
    block(width: essay-footer-width, height: essay-footer-height)[
      #align(right + horizon, [
        #label(footer-size, [PAGE #page], tracking: 0.01em)
      ])
    ],
  )
]

#let essay(doc, short-title: []) = [
  #set page(
    width: page-width,
    height: page-height,
    margin: essay-margin,
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
  #set par(justify: true, leading: 1.55em, spacing: 0.9em)
  #doc
]

#let page-title(title, deck: none) = block(
  below: 34pt,
  [
    #set text(size: 24pt, tracking: 0.04em, weight: "bold")
    #set par(justify: false, leading: 0.98em)
    #title

    #if deck != none [
      #v(10pt)
      #set text(size: 12pt, weight: "regular", style: "italic")
      #set par(justify: false, leading: 1.35em)
      #deck
    ]
  ],
)
