ifeq ($(TARGET),)
$(error You must specify a TARGET.)
endif

# https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
export buildsys_dir := $(shell dirname $(mkfile_path))

export project_dir := $(buildsys_dir)/../projects/$(TARGET)

include $(buildsys_dir)/cmdline.mk
include $(buildsys_dir)/toolchain.mk
include $(project_dir)/makefile

srcdirs = $(addprefix $(project_dir)/,$(APPS))
objdir = $(project_dir)/obj

src = $(foreach dir,$(srcdirs),$(wildcard $(dir)/*.c)) \
	  $(foreach dir,$(srcdirs),$(wildcard $(dir)/*.cc))

# src/test1.cc -> obj/test1.o
# src/test2.c -> obj/test2.o
obj = $(subst $(project_dir)/Apps/,$(objdir)/,\
	  $(patsubst %.cc,%.o, $(patsubst %.c,%.o,$(src))))

prog = $(patsubst %.o,%,$(obj))

# ----------------------------------------------------------------------------------

$(TARGET): $(objdir) $(obj) $(prog)
	$(echo) Linking objects: $(TARGET)

$(prog): $(objdir)/%: $(objdir)/%.o
	$(echo) Linking object: $@
	$(cxx) $(cxxflags) $< -o $@ $(ldflags)

$(objdir):
	$(mkdir) $@

$(objdir)/%.o: $(project_dir)/Apps/%.c
	$(echo) Building object: $@
	$(mkdir) $(shell dirname "$@")
	$(cc) $(cflags) $< -c -o $@

$(objdir)/%.o: $(project_dir)/Apps/%.cc
	$(echo) Building object: $@
	$(mkdir) $(shell dirname "$@")
	$(cxx) $(cxxflags) $< -c -o $@

clean:
	-rm -rf $(objdir)
