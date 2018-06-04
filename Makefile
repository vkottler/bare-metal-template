.PHONY: clean all
.PRECIOUS: %.elf
.DEFAULT_GOAL = all

REVISION = 0
PROJECT = template

# toolchain configurations
include mk/toolchain.mk

# collect sources
include src/conf.mk

OBJS = $(SRCS:.cc=.o)

# trigger dependency generation or them as rules if they exist
DEPS = $(SRCS:.cc=.d)
-include $(DEPS)

# payload recipes
include mk/rules.mk
