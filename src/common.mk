$(shell mkdir -p $(LINK_OBJS))

BUILD_DIR :=$(addprefix $(CUR_DIR)/,$(BUILD_DIR))
BUILD_DIR += $(CUR_DIR)
SRCS = $(foreach var_dir,$(BUILD_DIR),$(wildcard $(var_dir)/*.c))
OBJS := $(SRCS:.c=.o)
LIB := $(wildcard $(LIB_PATH)/*.a) \
	$(wildcard $(LIB_PATH)/*.so) \
	$(wildcard $(LIB_PATH)/ext_lib/*.so) \
	$(wildcard $(LI_PATH)/ext_lib/*.a) \

LIB1 = $(addprefix -l,$(subst lib,, $(basename $(notdir $(LIB)))))

LIB_PATH1 := $(LIB_PATH) \
	$(LIB_PATH)/ext_lib
LIB_PATH2 = $(addprefix -L,$(LIB_PATH1))

OBJS :=$(addprefix $(LINK_OBJS)/,$(notdir $(OBJS)))

DEEP = $(SRCS:.c=.d)

DEEP := $(addprefix $(TEMP_DIR)/,$(notdir $(DEEP)))
	
all:$(DEEP) $(OBJS) $(LIB_STATIC_NAME) $(LIB_DYNAMIC_NAME) $(BIN)

XPATH = $(filter %$(basename $(notdir $@)).c,$(SRCS))

ifneq ("$(wildcard $(DEEP))","")
include $(DEEP)
endif

BUILD_OPTION =
ifneq ("$(LIB_DYNAMIC_NAME)","")
BUILD_OPTION = -fPIC
endif


$(BIN):$(OBJS)
	echo "$(LIB)"
	$(CC) -o $@ $^ $(LIB_PATH2) $(LIB1)

$(LIB_DYNAMIC_NAME):$(OBJS)
	$(CC) -o $@ -shared $^

$(LIB_STATIC_NAME):$(OBJS)
	ar -rcs $@  $^

$(LINK_OBJS)/%.o:*.c
	$(CC) -I$(INC_DIR) -o $@ $(BUILD_OPTION) -c $(filter %$(basename $(notdir $@)).c,$(SRCS))

$(TEMP_DIR)/%.d:*.c
	
	$(CC) -I$(INC_DIR) -MM $(XPATH) | sed "s,\(.*\)\.o:,$(filter %$(basename $(notdir $(XPATH))).o,$(OBJS)):,g" > $@

clean:
	rm $(OBJS) $(TEMP_DIR) -rf
