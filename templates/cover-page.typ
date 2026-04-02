// Simple single-page cover template for issue openers.

#import "/templates/issue-state.typ": issue-date

#let page-size = 600pt

#let cover-page(
  title: [],
  issue: [],
  deck: none,
  contributors: none,
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
  #place(left + top, dx: 34pt, dy: 28pt, [
    #set text(size: 12pt, tracking: 0.08em)
    THE LOOSE COLLECTIVE
  ])

  #place(left + top, dx: 32pt, dy: 58pt, [
    #line(length: 536pt, stroke: 1pt + black)
  ])

  #place(left + top, dx: 32pt, dy: 92pt, block(width: 500pt)[
    #set text(size: 34pt, tracking: 0.04em, weight: "bold")
    #set par(justify: false, leading: 0.95em)
    #title
  ])

  #place(left + top, dx: 35pt, dy: 298pt, block(width: 220pt)[
    #set text(size: 16pt, tracking: 0.02em)
    #set par(justify: false, leading: 1.25em)
    ISSUE #issue
  ])

  #place(right + top, dx: -35pt, dy: 298pt, block(width: 220pt)[
    #set text(size: 16pt, tracking: 0.02em)
    #set par(justify: false)
    #context align(right)[#issue-date.get()]
  ])

  #if deck != none [
    #place(left + top, dx: 34pt, dy: 346pt, block(width: 500pt)[
      #set text(size: 17pt)
      #set par(justify: false, leading: 1.3em)
      #deck
    ])
  ]

  #if contributors != none [
    #place(left + bottom, dx: 34pt, dy: -42pt, block(width: 500pt)[
      #set text(size: 12pt, tracking: 0.01em)
      #set par(justify: false, leading: 1.3em)
      #contributors
    ])
  ]
]
