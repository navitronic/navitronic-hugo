.PHONY: build serve

build:
	hugo --minify

serve:
	hugo server --buildDrafts
