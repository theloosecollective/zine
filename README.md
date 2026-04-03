# Zine

Typst repo for making issues of a zine.

## Structure

- `templates/`: shared layouts and components
- `issues/issue-001/`: one self-contained issue
- `issues/issue-001/main.typ`: build this file to make the issue PDF
- `issues/issue-001/content/`: pages and writing
- `issues/issue-001/assets/`: issue-specific images and reference material

## Working Style

- Authors should mostly edit files in `issues/<issue>/content/`
- Template changes should stay in `templates/`
- Start a new issue by copying the previous issue folder
- Essay files should feel like normal Typst documents

```typst
#import "/templates/essay.typ": essay, page-title

#show: essay.with(short-title: [Example Essay])

#page-title([Example Essay], deck: [An optional deck.])

Body copy goes here.

More body copy goes here.
```

## Build

From the repo root:

```bash
typst compile --root . issues/issue-001/main.typ issues/issue-001/issue-001.pdf
```

For live rebuilds:

```bash
typst watch --root . issues/issue-001/main.typ issues/issue-001/issue-001.pdf
```

Or use `just`:

```bash
just issue issue-002
just work issue-001
just build issue-001
```
