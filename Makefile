# Switch this out depending on on system or docker pandoc

%.pdf: %.md
# Standard Pandoc
#	$(PANDOC) $< -o $@ --from markdown --template eisvogel --listings --citeproc

#If we are using docker we need to use this instead
	docker run --rm --volume $(shell pwd):/data --user $(shell id -u):$(shell id -g) pandoc/extra:latest-ubuntu $< --template eisvogel --listings --citeproc -o $@ 




