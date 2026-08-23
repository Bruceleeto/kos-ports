# Port Metadata
PORTNAME =          zlib
PORTVERSION =       1.3.2

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        Lossless data compression library

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     http://zlib.net
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libz.a
INSTALLED_HDRS =    zlib.h zconf.h

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk kos_zlib.c

# We build libz.a with -DHAVE_UNISTD_H/-DHAVE_STDARG_H rather than running
# upstream's ./configure, so the shipped zconf.h must be told about it too.
PREBUILD =          fixup-zconf

include ${KOS_PORTS}/scripts/kos-ports.mk

# Stock zconf.h guards these on "#if HAVE_UNISTD_H-0", which upstream's
# ./configure rewrites to "#if 1". Without that, the header disagrees with the
# library it describes: compiling libz.a defines Z_HAVE_UNISTD_H (so z_off_t is
# off_t, 4 bytes), while anything that later includes <zlib/zlib.h> does not
# (so z_off_t is long long, 8 bytes). gzseek()/gztell()/gzoffset() then get a
# mismatched argument layout and silently misbehave. Do what ./configure does.
# (sed -i is not portable to BSD/macOS, hence the explicit temporary file.)
fixup-zconf:
	@cd build/${PORTNAME}-${PORTVERSION} && \
	sed -e 's|^#if HAVE_UNISTD_H-0.*|#if 1     /* set by the KOS port: libz.a is built with -DHAVE_UNISTD_H */|' \
	    -e 's|^#if HAVE_STDARG_H-0.*|#if 1     /* set by the KOS port: libz.a is built with -DHAVE_STDARG_H */|' \
	    zconf.h > zconf.h.kos && mv zconf.h.kos zconf.h
