# https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
export project_dir := $(shell dirname $(mkfile_path))

export TARGET=$(current_dir)

include $(project_dir)/../../build/buildsystem.mk
