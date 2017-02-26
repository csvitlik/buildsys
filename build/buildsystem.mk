# https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
export buildsys_dir := $(shell dirname $(mkfile_path))

include $(buildsys_dir)/cmdline.mk

include $(buildsys_dir)/toolchain.mk

include $(buildsys_dir)/target_rules.mk
