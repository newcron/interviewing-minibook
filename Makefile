SHELL:=/bin/bash

build: build-web build-pdf build-epub build-mobi

build-web: clean
	@gulp styles #todo: run in container
	@docker run -v `pwd`:/source jagregory/pandoc -f markdown -s -t html5  --toc --toc-depth 2 -o /source/_book/book.html --template=/source/src/template-web.html /source/src/book.md
build-pdf: clean
	@echo "to do"

build-epub: clean
	@echo "to do"

build-mobi: clean
	@echo "to do"

deploy: build
	cd _book && wput -u * ftp://matluc.de

clean:
	rm -rf _book
	mkdir _book
