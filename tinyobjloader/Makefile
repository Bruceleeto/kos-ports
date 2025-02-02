PORTNAME    = tinyobjloader
PORTVERSION = 1.0

MAINTAINER  = Bruce
LICENSE     = MIT
SHORT_DESC  = Single header C library for loading Wavefront .obj files

DEPENDENCIES =

DOWNLOAD_SITE   = https://raw.githubusercontent.com/syoyo/tinyobjloader-c/master/
DOWNLOAD_FILESB = tinyobj_loader_c.h

TARGET          = libtinyobjloader.a
INSTALLED_HDRS  = tinyobj_loader_c.h
HDR_INSTDIR     = tinyobjloader

KOS_DISTFILES   = KOSMakefile.mk tinyobjloader.c

include ${KOS_PORTS}/scripts/kos-ports.mk

fetch:
	@if [ ! -d "dist" ]; then \
		mkdir dist ; \
	fi

	@cd dist ; \
	for _file in ${DOWNLOAD_FILESB}; do \
		if [ ! -f "$$_file" ] ; then \
			echo "fetchB"; \
			echo "Fetching $$_file from ${DOWNLOAD_SITE} ..." ; \
			file="${DOWNLOAD_SITE}/$$_file" ; \
			${FETCH_CMD} $$file ; \
		fi ; \
		mkdir -p ${PORTNAME}-${PORTVERSION}; \
		mv ${DOWNLOAD_FILESB} ${PORTNAME}-${PORTVERSION}/ ; \
		tar -czvf ${PORTNAME}-${PORTVERSION}.tar.gz ${PORTNAME}-${PORTVERSION} ; \
	done
