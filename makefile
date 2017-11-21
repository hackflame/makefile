include config.mk
.PHNOY = all clean install uninstall
BUILD_M =xxx

all:$(BUILD_M)
	make -C $(MAIN_MODULE)

$(BUILD_M):
	echo "$(_BUILD_MODULE)"
	for subdir in $(_BUILD_MODULE); \
	do \
		make -C $$subdir; \
	done

clean:
	rm $(ROOT_DIR)/tmp $(ROOT_DIR)/lib/*.so  $(ROOT_DIR)/bin/* -rf 

install:
	cp $(ROOT_DIR)/bin/* /usr/bin/
	cp $(A_DLL_LIB)  /usr/lib/

uninstall:
	rm /usr/bin/mp3 -rf
	rm $(addprefix /usr/lib/,$(DLL_LIB)) -rf
