// Simple single-page cover template for issue openers.

#import "/templates/geometry.typ": *
#import "/templates/issue-state.typ": issue-date

#let cover-page(
  title: [],
  issue: [],
  deck: none,
  contributors: none,
) = [
  #set page(
    width: page-width,
    height: page-height,
    margin: 0pt,
    fill: white,
  )
  #set text(
    font: "Berkeley Mono",
    fill: black,
    lang: "en",
  )
  #place(left + top, dx: cover-inset, dy: cover-kicker-y, [
    #set text(size: 10pt, tracking: 0.08em)
    THE LOOSE COLLECTIVE
  ])

  #place(left + top, dx: cover-inset, dy: cover-rule-y, [
    #line(length: cover-rule-length, stroke: 1pt + black)
  ])

  #place(left + top, dx: cover-inset, dy: cover-title-y, block(width: cover-content-width)[
    #set text(size: 28pt, tracking: 0.04em, weight: "bold")
    #set par(justify: false, leading: 0.95em)
    #title
  ])

  #place(left + top, dx: cover-inset, dy: cover-meta-y, block(width: cover-meta-width)[
    #set text(size: 14pt, tracking: 0.02em)
    #set par(justify: false, leading: 1.25em)
    ISSUE #issue
  ])

  #place(right + top, dx: -cover-inset, dy: cover-meta-y, block(width: cover-meta-width)[
    #set text(size: 14pt, tracking: 0.02em)
    #set par(justify: false)
    #context align(right)[#issue-date.get()]
  ])

  #if deck != none [
    #place(left + top, dx: cover-inset, dy: cover-deck-y, block(width: cover-content-width)[
      #set text(size: 14pt)
      #set par(justify: false, leading: 1.3em)
      #deck
    ])
  ]

  #if contributors != none [
    #place(left + bottom, dx: cover-inset, dy: cover-contributors-y, block(width: cover-content-width)[
      #set text(size: 10.5pt, tracking: 0.01em)
      #set par(justify: false, leading: 1.3em)
      #contributors
    ])
  ]
]
