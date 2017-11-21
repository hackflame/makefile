SINGLE_BUILD=true
ifneq ("$(SINGLE_BUILD)","")
 ROOT_DIR := /root/mk
 CC=gcc
 INC_DIR :=$(ROOT_DIR)/inc
 TEMP_DIR := $(ROOT_DIR)/tmp/d
 LIB_PATH :=$(ROOT_DIR)/lib
 $(shell mkdir -p $(LIB_PATH)/ext_lib)
 $(shell mkdir -p $(TEMP_DIR))
endif
