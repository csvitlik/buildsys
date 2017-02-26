# https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
export top_dir := $(shell dirname $(mkfile_path))

include $(top_dir)/build/toolchain.mk

ifneq ($(TARGET),)
all:
	$(make) -C projects/$(TARGET) \
		TARGET=$(TARGET) $(MAKECMDGOALS)

$(MAKECMDGOALS): all
else
$(MAKECMDGOALS):
	$(make) -C projects/$(MAKECMDGOALS) \
		TARGET=$(MAKECMDGOALS) $(MAKECMDGOALS)

all:
	@echo 'Build Targets:'
	@echo ''
	@echo '	doc	Build doxygen doxumentation.'
	@echo '	clean	Clean doxygen doxumentation.'
	@echo ''
	@echo '	TARGET=test 		Build test project.'
	@echo '	TARGET=test clean	Clean test project.'

doc:
	$(doxygen) build/Doxyfile

clean:
	$(rm) $(DOXY_DIRS)
endif

.PHONY: all clean doc help $(TARGET)

# vim: ts=8
