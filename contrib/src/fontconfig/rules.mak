# FONTCONFIG
FONTCONFIG_VERSION := 2.11.1
FONTCONFIG_URL := http://www.freedesktop.org/software/fontconfig/release/fontconfig-$(FONTCONFIG_VERSION).tar.gz


$(TARBALLS)/fontconfig-$(FONTCONFIG_VERSION).tar.gz:
	$(call download,$(FONTCONFIG_URL))

.sum-fontconfig: fontconfig-$(FONTCONFIG_VERSION).tar.gz

fontconfig: fontconfig-$(FONTCONFIG_VERSION).tar.gz .sum-fontconfig
	$(UNPACK)
	$(MOVE)

.fontconfig: fontconfig
	$(RECONF)
	cd $< && $(HOSTVARS) ./configure $(HOSTCONF)
	cd $< && $(MAKE) install
	touch $@
