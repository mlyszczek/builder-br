################################################################################
#
# embedlog
#
################################################################################

EMBEDLOG_VERSION = 0.5.0
EMBEDLOG_SOURCE = embedlog-$(EMBEDLOG_VERSION).tar.gz
EMBEDLOG_SITE = http://distfiles.kurwinet.pl/embedlog
EMBEDLOG_INSTALL_STAGING = YES
EMBEDLOG_LICENSE = BSD-2-Clause
EMBEDLOG_LICENSE_FILES = LICENSE

$(eval $(autotools-package))
