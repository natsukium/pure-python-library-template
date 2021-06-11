SRCDIR := library_template
SRC := $(wildcard $(SRCDIR)/*.py) $(wildcard $(SRCDIR)/**/*.py)
DOCSRCDIR := docs
DOCSRC := $(DOCSRCDIR)/source
DOCS := docs/build/index.html

.PHONY: docs test
docs: $(DOCS)

$(DOCS): $(SRC) $(DOCSRC)/conf.py $(DOCSRC)/*.rst
	poetry run sphinx-apidoc -f -o docs/source .
	poetry run sphinx-build -b html docs/source docs/build

test:
	poetry run pytest -v --cov=library_template/ --cov-report=
	poetry run flake8
	yarn run pyright
