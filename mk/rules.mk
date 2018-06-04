$(OBJS): | $(OBJ_DIR)

$(OBJ_DIR):
	@[ ! -d $(OBJ_DIR) ] && mkdir $(OBJ_DIR) 

%.o: %.cc
	+@echo "building '$(notdir $<)'"
	@$(TOOLCHAIN)g++ $(CXXFLAGS) -c -o $@ $<

%.o: %.c
	+@echo "building '$(notdir $<)'"
	@$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

# From https://www.gnu.org/software/make/manual/html_node/Automatic-Prerequisites.html
%.d: %.cc
	@set -e; rm -f $@; \
	$(TOOLCHAIN)gcc -MM -MT '$*.o' $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
%.d: %.c
	@set -e; rm -f $@; \
	$(TOOLCHAIN)gcc -MM -MT '$*.o' $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

%.bin: %.elf
	@$(TOOLCHAIN)objcopy -O binary $< $@
	+@printf "copying '$(notdir $<)' -> '$(notdir $@)' ("
	@stat --printf="%s" $@
	+@echo " / $(ROM_SIZE))"

clean:
	@find . -name '*.o' -delete
	@find . -name '*.d' -delete
	@find . -name '*.d.*' -delete
	@rm -rf $(OBJ_DIR)

%.elf: $(OBJS)
	@$(TOOLCHAIN)g++ $(CXXFLAGS) $^ $(LFLAGS) -Wl,-Map=$*.map -o $@
	+@echo "linking '$(notdir $@)'"

all: $(OBJ_DIR)/$(PROJECT).bin
