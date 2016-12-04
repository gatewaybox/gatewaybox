################################################################################
#
# lttng-libust
#
################################################################################

LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
LTTNG_LIBUST_VERSION = 2.9.0
LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
LTTNG_LIBUST_LICENSE_FILES = COPYING
LTTNG_LIBUST_INSTALL_STAGING = YES
LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
LTTNG_LIBUST_CONF_OPTS += --disable-man-pages

ifeq ($(BR2_PACKAGE_PYTHON),y)
LTTNG_LIBUST_DEPENDENCIES += python
LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
else ifeq ($(BR2_PACKAGE_PYTHON3),y)
LTTNG_LIBUST_DEPENDENCIES += python3
LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
else
LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
endif

$(eval $(autotools-package))
