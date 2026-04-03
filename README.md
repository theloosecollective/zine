# Zine

Typst repo for making issues of a zine.

## Structure

- `templates/`: shared layouts and components
- `issues/issue-001/`: one self-contained issue
  - `main.typ`: the entrypoint of the issue; assemble all essays/content here
  - `content/`: pages and writing
  - `assets/`: issue-specific images and reference material

## Working Style

- Authors should mostly edit files in `issues/<issue>/content/`
- Template changes should stay in `templates/`; mostly don't need to edit here
- Start a new issue by copying the previous issue folder
- Essay files should feel like normal Typst documents

_Example post. This would live in `issues/issue-001/content/example-essay.typ`. It represents a single article within an issue._
```typst
#import "/templates/essay.typ": essay, page-title

#show: essay.with(short-title: [Example Essay])

#page-title([Example Essay], deck: [An optional deck.])

Body copy goes here.

More body copy goes here.
```

## Starting a new issue

Copy content from previous issue
```bash
# issue-002 is the name of the new issue you're about to create
just issue issue-002
```

### Live preview your PDF while working

From the repo root:
```bash
just work issue-002
```
This will re-produce the PDF as you work and allow you view the rendered pages.

### Writing articles & essays

Once you have `just work` running, create new `.typ` files in the `issues/issue-002/content` directory.

### Compiling an issue

Each issue has an entrypoint conventionally named `main.typ`. This file assembles an issue and typically looks like this:
```typst
#import "/templates/issue-state.typ": issue-date

#issue-date.update([MARCH 2026])

// Here we assemble the components of the issue. Besides the cover, each include can be many pages. 
#include "content/00-cover.typ"
#pagebreak()
#include "content/01-specimen.typ"
#pagebreak()
#include "content/02-editorial-note.typ"
```






