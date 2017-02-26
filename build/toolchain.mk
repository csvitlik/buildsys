# Here, we define the tools necessary to build.
export CROSS   ?=
export cxx     = $(Q)$(CROSS)g++
export ar      = $(Q)$(CROSS)ar
export as      = $(Q)$(CROSS)as
export cc      = $(Q)$(CROSS)gcc
export doxygen = $(Q)doxygen
export echo    = $(Q)echo
export make    = $(Q)make
export mkdir   = $(Q)mkdir -p
export rm      = $(Q)rm -rf

export arflags  ?=
export asflags  ?=
export cflags   ?= -std=c11   -W -Wall -Werror -pedantic -O2 -g $(DEBUG_FLAGS)
export cxxflags ?= -std=c++11 -W -Wall -Werror -pedantic -O2 -g $(DEBUG_FLAGS)

export DOXY_DIRS = html latex
