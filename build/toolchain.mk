# Here, we define the tools necessary to build.
CROSS    ?=
ar       := $(Q)$(CROSS)ar
as       := $(Q)$(CROSS)as
cc       := $(Q)$(CROSS)gcc
cxx      := $(Q)$(CROSS)g++
doxygen  := $(Q)doxygen
echo     := $(Q)echo
make     := $(Q)make
mkdir    := $(Q)mkdir -p
rm       := $(Q)rm -rf

includes =
defines =
flags = -W -Werror -Wall -Wextra -pedantic -O2 -g0 \
		$(DEBUG_FLAGS) \
		$(defines) \
		$(includes)

arflags  :=
asflags  :=
cflags   := -std=c11   $(flags)
cxxflags := -std=c++11 $(flags)
ldflags  :=
