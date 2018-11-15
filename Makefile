serve:
	@docker run --rm -v "$$PWD:/gitbook" -p 4000:4000 billryan/gitbook gitbook serve

build: 
	@docker run --rm -v "$$PWD:/gitbook" -p 4000:4000 billryan/gitbook gitbook build

