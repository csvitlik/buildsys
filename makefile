.PHONY: all clean doc help zip

.DEFAULT_GOAL = help

TOP_DIR := $(CURDIR)
BASENAME := $(notdir $(TOP_DIR))

%:
	$(MAKE) TARGET=$@ -C build $@

all: allprojects doc zip

allprojects:
	@$(foreach dir,$(wildcard projects/*),\
	    $(MAKE) TARGET=$(notdir $(dir)) -C build $(notdir $(dir)) ;)

clean:
	@rm -rf html latex $(BASENAME).zip
	@$(foreach dir,$(wildcard projects/*),\
	    $(MAKE) TARGET=$(notdir $(dir)) -C build clean ;)

doc:
	doxygen build/Doxyfile

help:
	@echo 'Special Targets:'
	@echo ''
	@echo '	all	Build all projects.'
	@echo '	clean	Clean all projects.'
	@echo '	doc	Build doxygen documentation package.'
	@echo '	help	This help message.'
	@echo '	zip	Build distribition zip.'
	@echo ''
	@echo 'Available Projects:'
	@echo ''
	@$(foreach dir,$(wildcard projects/*),\
	    echo "	$(notdir $(dir))" ;)
	@echo ''

zip:
	cd .. ; zip -r -9 \
	    $(TOP_DIR)/$(BASENAME).zip \
	    $(BASENAME) \
	    -x \*.git/\*

# vim: ts=8
