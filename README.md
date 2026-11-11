[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)

# Jaemin Oh's Website


## Commands

install dependencies: `uv sync --locked`

view the site locally: `uv run mkdocs serve`

publish the site: `uv run mkdocs gh-deploy --force`

script for publish the site: `sh publish.sh`


## Local setup

Install [uv](https://docs.astral.sh/uv/getting-started/installation/), then
install the project dependencies:

```sh
uv sync --locked
```

uv manages Python 3.13 and the `.venv` environment; manual activation is not
required. Dependencies are declared in `pyproject.toml`, and `uv.lock` records
their resolved versions. Commit both files when changing dependencies with
`uv add` or `uv remove`.

The bibliography plugin also requires the Pandoc executable. The `pypandoc`
Python package is included in `pyproject.toml`, but does not install that
executable.

Download the macOS installer from [Pandoc's installation page](https://pandoc.org/installing.html).
Choose the package matching your Mac's CPU architecture (`uname -m`):

- Apple Silicon (`arm64`): choose the `arm64-macOS.pkg` installer.
- Intel (`x86_64`): choose the `x86_64-macOS.pkg` installer.

Verify Pandoc works, then start the local preview:

```sh
pandoc --version
uv run mkdocs serve
```

### Troubleshooting Pandoc

If `uv run mkdocs serve` reports `Bad CPU type in executable`, the installed Pandoc
binary does not match your Mac's architecture. Install the matching package
above. A subsequent `No pandoc was found` message can mean Pandoc was found but
could not run.

To inspect the architecture of the Pandoc executable on your PATH:

```sh
uname -m
command -v pandoc
file "$(command -v pandoc)"
```

If the error mentions `~/Applications/pandoc/pandoc`, check that copy too;
`pypandoc` also searches that location. Avoid rerunning
`pypandoc.pandoc_download.download_pandoc()` if it downloads an incompatible
binary. You can explicitly select a working executable with:

```sh
PYPANDOC_PANDOC="$(command -v pandoc)" uv run mkdocs serve
```
