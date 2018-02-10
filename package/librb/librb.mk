################################################################################
#
# librb
#
################################################################################

LIBRB_VERSION = 1.0.0
LIBRB_SOURCE = librb-$(LIBRB_VERSION).tar.gz
LIBRB_SITE = http://distfiles.kurwinet.pl/librb
LIBRB_INSTALL_STAGING = YES
LIBRB_LICENSE = BSD-2-Clause
LIBRB_LICENSE_FILES = COPYING

$(eval $(autotools-package))
