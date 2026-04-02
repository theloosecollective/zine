#import "/templates/essay.typ": essay, page-title, section

#essay(short-title: [Editorial Notes For Contributors])[
  #page-title([Editorial Notes For Contributors])

  #section(sidebar: [
    EDITORIAL
    NOTES
    FOR
    CONTRIBUTORS

    Section 12.10
  ])[
    This repository is meant to stay approachable. Each issue lives in its own
    folder. Shared layouts live in the templates directory. Most contributors
    should only need to edit files in the content folder of the current issue.
    That means a writer can duplicate an earlier page, replace the words, and
    keep moving without understanding the whole system.

    The intended workflow is plain. Build an issue from its main file. Add new
    pages by creating another Typst file in the issue's content directory and
    including it from main.typ. When the publication evolves, the templates can
    evolve with it, but the issue folders should remain stable records of what
    was published at that moment in time.
  ]

  #section(sidebar: [
    KEEP IT
    SIMPLE
  ])[
    Keep the defaults simple. If a contributor needs to learn layout internals
    just to draft an essay page, the system is too clever. Templates should
    absorb complexity so the content files can stay readable.
  ]
]
