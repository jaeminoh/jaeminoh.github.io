[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)

# Jaemin Oh's Website


## Commands

export conda env: `conda env export | grep -v "^prefix: " > environment.yml`

view the site locally: `mkdocs serve`

publish the site: `mkdocs gh-deploy --force`

script for publish the site: `sh publish.sh`


## How to install pandoc
pandoc is necessary for bibtex.

1. `pip install pypandoc`
2. run Python REPL and type:
```python
from pypandoc.pandoc_download import download_pandoc

download_pandoc()
```