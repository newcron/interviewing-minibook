SHELL:=/bin/bash

build: build-web build-pdf build-epub build-mobi

build-web: clean
	@docker run --rm -v "$$PWD:/gitbook"  billryan/gitbook gitbook build

build-pdf: clean
	@docker run --rm -v  "$$PWD:/gitbook"  billryan/gitbook gitbook pdf . ./_book/interviewing.pdf

build-epub: clean
	@docker run --rm -v  "$$PWD:/gitbook"  billryan/gitbook gitbook epub . ./_book/interviewing.epub

build-mobi: clean
	@docker run --rm -v  "$$PWD:/gitbook"  billryan/gitbook gitbook mobi . ./_book/interviewing.mobi


run:
	@docker run -d --name "gitbook-server-interviewing-minibook" --rm -v "$$PWD:/gitbook" -p 4000:4000  billryan/gitbook gitbook serve
	@echo "To see the book, go to http://localhost:4000.\nTo stop the server, run 'make stop' (with sudo if you are on Linux)"
stop: 
	@docker kill gitbook-server-interviewing-minibook

deploy: build
	cd _book && wput -u * ftp://matluc.de

clean: 
	rm -rf _book
