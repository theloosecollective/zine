// Shared page geometry for the zine.

#let page-width = 5.5in
#let page-height = 8.5in

// Essay page tokens.
#let essay-outer-inset = 20pt
#let essay-rail-width = 74pt
#let essay-rail-gutter = 16pt
#let essay-header-height = 64pt
#let essay-rule-gap = 5pt
#let essay-body-gap = 29pt
#let essay-footer-height = 46pt
#let essay-running-title-width = 280pt
#let essay-date-width = 110pt
#let essay-footer-width = 90pt

// Essay page derived geometry.
#let essay-divider-x = essay-rail-width
#let essay-rules-y = essay-header-height
#let essay-body-left = essay-divider-x + essay-rail-gutter
#let essay-body-top = essay-rules-y + essay-rule-gap + essay-body-gap
#let essay-margin = (
  top: essay-body-top,
  right: essay-outer-inset,
  bottom: essay-footer-height,
  left: essay-body-left,
)

// Cover page geometry.
#let cover-inset = 24pt
#let cover-kicker-y = 20pt
#let cover-rule-y = 48pt
#let cover-rule-length = 348pt
#let cover-title-y = 72pt
#let cover-meta-y = 246pt
#let cover-deck-y = 288pt
#let cover-contributors-y = -28pt
#let cover-content-width = 330pt
#let cover-meta-width = 150pt
