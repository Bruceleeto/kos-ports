TARGET = libcgltf.a
OBJS = cgltf.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
