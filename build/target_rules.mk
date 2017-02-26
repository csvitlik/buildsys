srcdir = $(project_dir)/src
objdir = $(project_dir)/obj

src = $(wildcard $(srcdir)/*)

# src/test1.cc -> obj/test1.o
# src/test2.c -> obj/test2.o
obj = $(subst $(srcdir)/,$(objdir)/, \
		$(patsubst %.cc,%.o, $(patsubst %.c,%.o,$(src))))

# obj/test1.o -> obj/test1
prog = $(patsubst %.o,%,$(obj))

all: $(TARGET)
	@true

$(TARGET): $(objdir) $(prog)

$(objdir):
	$(mkdir) $@

$(objdir)/%: $(srcdir)/%.c
	$(cc) $(cflags) $< -o $@

$(objdir)/%: $(srcdir)/%.cc
	$(cxx) $(cxxflags) $< -o $@

clean:
	$(rm) $(objdir)
