PORTNAME    = cgltf
PORTVERSION = 1.0

MAINTAINER  = Bruce
LICENSE     = MIT
SHORT_DESC  = Single header library for parsing glTF 2.0 files.

DEPENDENCIES =

DOWNLOAD_SITE   = https://raw.githubusercontent.com/jkuhlmann/cgltf/master/
DOWNLOAD_FILESB = cgltf.h



TARGET          = libcgltf.a
INSTALLED_HDRS  = cgltf.h
HDR_INSTDIR     = cgltf

KOS_DISTFILES   = KOSMakefile.mk cgltf.c

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
