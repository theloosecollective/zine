set shell := ["zsh", "-cu"]

issues_dir := "issues"

default:
    @just --list

issue name:
    @if [[ -d "{{ issues_dir }}/{{ name }}" ]]; then echo "Issue already exists: {{ issues_dir }}/{{ name }}" >&2; exit 1; fi
    @previous=$$(find "{{ issues_dir }}" -mindepth 1 -maxdepth 1 -type d | sort | tail -n 1); \
      if [[ -z "$$previous" ]]; then \
        mkdir -p "{{ issues_dir }}/{{ name }}/content" "{{ issues_dir }}/{{ name }}/assets"; \
        printf '# TODO: assemble this issue\n' > "{{ issues_dir }}/{{ name }}/main.typ"; \
        echo "Created empty issue: {{ issues_dir }}/{{ name }}"; \
      else \
        cp -R "$$previous" "{{ issues_dir }}/{{ name }}"; \
        output="{{ issues_dir }}/{{ name }}/{{ name }}.pdf"; \
        rm -f "$$output"; \
        echo "Copied $$previous -> {{ issues_dir }}/{{ name }}"; \
      fi

work name:
    typst watch --root . "{{ issues_dir }}/{{ name }}/main.typ" "{{ issues_dir }}/{{ name }}/{{ name }}.pdf"

build name:
    typst compile --root . "{{ issues_dir }}/{{ name }}/main.typ" "{{ issues_dir }}/{{ name }}/{{ name }}.pdf"
