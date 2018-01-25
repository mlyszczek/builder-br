################################################################################
#
# librb
#
################################################################################

LIBRB_VERSION = 2.1.2
LIBRB_SOURCE = librb-$(LIBRB_VERSION).tar.gz
LIBRB_SITE = http://distfiles.kurwinet.pl/librb
LIBRB_INSTALL_STAGING = YES
LIBRB_LICENSE = BSD-2-Clause
LIBRB_LICENSE_FILES = LICENSE

$(eval $(autotools-package))
