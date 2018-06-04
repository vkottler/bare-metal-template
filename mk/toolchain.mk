# arm-none-eabi-
TOOLCHAIN =

# -DSTM32L4 -DSTM32L432xx -DARMCM4_DP -DARMCM4
CPU_DEFINES = 
ROM_SIZE = NUM_BYTES

# -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
FPU =

# -mthumb -march=armv7e-m
ARCH_FLAGS = 

INCLUDES = -I include

CFLAGS = $(FPU) $(ARCH_FLAGS) $(DEFINES) $(CPU_DEFINES) $(INCLUDES)

CXXFLAGS = $(CFLAGS) -std=gnu++14

# --specs=nosys.specs -Wl,--gc-sections
LFLAGS =
# -Tsrc/startup/link.ld
LFLAGS +=

OBJ_DIR = bin

# potentially useful version control definitions
GIT_TIME=$(shell git log -n 1 --date=iso --pretty=format:"%cd")
GIT_VERSION=$(shell git log -n 1 --pretty=format:"%h-%cn")
SHELL_TIME=$(shell date)
DEFINES+=-D_GIT_TIME="\"$(GIT_TIME)\"" -D_GIT_VERSION="\"$(GIT_VERSION)\""
DEFINES+=-D_SHELL_TIME="\"$(SHELL_TIME)\""
DEFINES+=-D__VERSION='$(REVISION)'
