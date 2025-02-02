TARGET = libtinyobjloader.a
OBJS = tinyobjloader.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
