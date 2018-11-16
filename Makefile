SHELL:=/bin/bash

build: clean
	@docker run --rm -v "$$PWD:/gitbook"  billryan/gitbook gitbook build

run:
	@docker run -d --name "gitbook-server-interviewing-minibook" --rm -v "$$PWD:/gitbook" -p 4000:4000  billryan/gitbook gitbook serve
	@echo "To see the book, go to http://localhost:4000.\nTo stop the server, run 'make stop' (with sudo if you are on Linux)"
stop: 
	@docker kill gitbook-server-interviewing-minibook

deploy: build
	cd _book && wput * ftp://matluc.de

clean: 
	rm -rf _book
