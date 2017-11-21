#root dir
export ROOT_DIR := $(shell pwd)
#build tools
export CC=gcc
# .h file dir
export INC_DIR :=$(ROOT_DIR)/inc
#temp file dir
export TEMP_DIR := $(ROOT_DIR)/tmp/d
#lib dir
export LIB_PATH :=$(ROOT_DIR)/lib
#create lib dir
$(shell mkdir -p $(LIB_PATH)/ext_lib)

# create temp dir
$(shell mkdir -p $(TEMP_DIR))

# uninstall so 
DLL_LIB =libmaths.so \
	ext_lib/libtest.so

#install so
A_DLL_LIB = $(addprefix $(LIB_PATH)/,$(DLL_LIB))

#build module

MAIN_MODULE := $(ROOT_DIR)/src/app 

BUILD_MODULE = jpg \
		math
 
_BUILD_MODULE = $(addprefix $(ROOT_DIR)/src/,$(BUILD_MODULE))
