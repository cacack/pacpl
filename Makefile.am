#  Perl Audio Converter
#
#  Copyright (C) 2005-2013 Philip Lyons (vorzox@gmail.com)
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

PACKAGE_NAME    = @PACKAGE_NAME@
PACKAGE_VERSION = @PACKAGE_VERSION@
INSTALL_KONQ    = @INSTALL_KONQ@
INSTALL_DOLP    = @INSTALL_DOLP@
INSTALL_D3LP    = @INSTALL_D3LP@

ACLOCAL_M4 = ./aclocal.m4

#
# Modules & Documentation
#

DOCS = README AUTHORS TODO NEWS

LANG_MODS = po/ca.po \
	    po/de.po \
	    po/en_US.po \
	    po/es.po \
	    po/et.po \
	    po/fr_FR.po \
	    po/GR.po \
	    po/it_IT.po \
	    po/nl_NL.po \
	    po/pl.po \
	    po/pt.po \
	    po/ro.po \
	    po/ru_RU.po \
	    po/tr.po \
	    po/zh_CN.po
	    
EXTRAS = extra/README.extra \
	 extra/README.module \
	 extra/sample.m

#
# Plugin directories
#

DOLPDIR   = plugins/dolphin
D3LPDIR   = plugins/d3lphin
KONQDIR   = plugins/konqueror

#
# Default KDE directory
#

DESTDIR = 
KDEDIR  = /usr

#
# Target KDE directories
#

KONQ_PLUGDIR   = $(DESTDIR)$(KDEDIR)/share/kde4/services
DOLP_PLUGDIR   = $(DESTDIR)$(KDEDIR)/share/kde4/services

#
# Compiler tools definitions...
#

POD2MAN = @POD2MAN@
POD2HTML = @POD2HTML@
GZIP = @GZIP@
RM = @RM@ -f
SHELL = /bin/sh

#
# Configured directories...
#

prefix      =  @prefix@
exec_prefix =  @exec_prefix@
bindir      =  @bindir@
datarootdir =  @datarootdir@
includedir  =  @includedir@
libdir      =  @libdir@
mandir      =  @mandir@
docdir      =  @docdir@

#
# Configuration files directories and other
#
CONF_DIR = $(DESTDIR)/etc/$(PACKAGE_NAME)
PO_DIR   = $(DESTDIR)/usr/share/pacpl/locale
MOD_DIR  = $(CONF_DIR)/modules
DOC_DIR  = $(DESTDIR)$(docdir)
MAN_DIR  = $(DESTDIR)$(mandir)/man1
DOC_EXTRA_DIR = $(DOC_DIR)/extra

all : pacpl.1.gz

pacpl.1.gz : pacpl
	$(POD2MAN) $< |	$(GZIP) -9 > $@
	touch $@

install: all main install-plugins

main:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(CONF_DIR)
	$(INSTALL) -d $(PO_DIR)
	$(INSTALL) -d $(MOD_DIR)
	$(INSTALL) -d $(MAN_DIR)
	$(INSTALL) -d $(DOC_DIR)
	$(INSTALL) -d $(DOC_EXTRA_DIR)

	$(INSTALL) pacpl -t $(DESTDIR)$(bindir)
	$(INSTALL_DATA) pacpl.conf codecs.conf -t $(CONF_DIR)
	$(INSTALL_DATA) $(LANG_MODS) -t $(PO_DIR)
	$(INSTALL_DATA) extra/sample.m -t $(MOD_DIR)
	$(INSTALL_DATA) pacpl.1.gz -t $(MAN_DIR)
	$(INSTALL_DATA) $(DOCS) -t $(DOC_DIR)
	$(INSTALL_DATA) $(EXTRAS) -t $(DOC_EXTRA_DIR)

install-plugins:
if INSTALL_KONQ
	$(INSTALL) -d $(KONQ_PLUGDIR)
	$(INSTALL_DATA) $(KONQDIR)/pacpl.desktop -t $(KONQ_PLUGDIR)
endif

if INSTALL_DOLP
	$(INSTALL) -d $(DOLP_PLUGDIR)
	$(INSTALL_DATA) $(DOLPDIR)/pacpl.desktop -t $(DOLP_PLUGDIR)
endif

clean:
	$(RM) pacpl.1.gz

distclean: clean
	$(RM) config.log
	$(RM) config.status
	$(RM) Makefile
	find . -name '*~' -exec $(RM) '{}' \;

uninstall: uninstall-plugins
	$(RM) $(DESTDIR)$(bindir)/pacpl
	$(RM) $(MAN_DIR)/pacpl.1.gz
	$(RM) -r $(CONF_DIR)
	$(RM) -r $(DOC_DIR)
	$(RM) -r $(DESTDIR)/usr/share/pacpl

uninstall-plugins:
	if INSTALL_KONQUER_PLUGIN
		$(RM) $(KONQ_PLUGDIR)/pacpl.desktop
	endif
	if INSTALL_DOLPHIN_PLUGIN
		$(RM) $(DOLP_PLUGDIR)/pacpl.desktop
	endif
	