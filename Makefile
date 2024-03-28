# Switch this out depending on on system or docker pandoc
# We are also Build for the Docker Version (3.11) Which is prob the same in debian

PANDOC=pandoc
TEMPLATE=eisvog_fyp
#TEMPLATE=remote_vogel
PANDOC_ARGS= --listings --citeproc --top-level-division=chapter --number-sections --data-dir=./template
FILTERS=./template/include-files.lua
%.pdf: %.md 
# Standard Pandoc
	$(PANDOC) $< -o $@ --from markdown --template $(TEMPLATE) --lua-filter $(FILTERS) $(PANDOC_ARGS)

#If we are using docker we need to use this instead
	#docker run --rm --volume $(shell pwd):/data --user $(shell id -u):$(shell id -g) pandoc/extra:latest-ubuntu $< -o $@ --template $(TEMPLATE) --lua-filter $(FILTERS) $(PANDOC_ARGS) 


%.tex: %.md 
# Standard Pandoc
	#$(PANDOC) $< -o $@ --from markdown --template $(TEMPLATE) $(PANDOC_ARGS)

#If we are using docker we need to use this instead
	docker run --rm --volume $(shell pwd):/data --user $(shell id -u):$(shell id -g) pandoc/extra:latest-ubuntu $< -o $@ --template $(TEMPLATE) $(PANDOC_ARGS)




