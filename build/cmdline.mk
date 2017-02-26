# Here, we parse command line using $(origin) makefile semantics.
ifeq ($(origin V),command line)
	BUILD_VERBOSE = $(V)
else
	BUILD_VERBOSE =
endif

ifeq ($(origin D),command line)
	BUILD_DEBUG = $(D)
else
	BUILD_DEBUG =
endif

#######################################################################

ifeq ($(BUILD_VERBOSE),1)
	Q =
else
	Q = @
endif

ifeq ($(BUILD_DEBUG),1)
	DEBUG_FLAGS = -O0 -ggdb
else
	DEBUG_FLAGS =
endif

#######################################################################

export DEBUG_FLAGS
export Q
