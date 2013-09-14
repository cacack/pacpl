# Process this file with autoconf to produce a configure script.
#
# Copyright (C) 2007-2013 Philip Lyons (vorzox@gmail.com)

AC_PACKAGE_NAME(Perl Audio Converter)
AC_PACKAGE_TARNAME(pacpl-4.1.0-beta1.tar.gz)
AC_PACKAGE_VERSION(4.1.0-beta1)
AC_PACKAGE_BUGREPORT(vorzox@gmail.com)

m4_include([aclocal/ax_prog_perl_modules.m4])

AC_PROG_PERL_VERSION(5.18.0)
AC_PREREQ([2.69])

AC_INIT([pacpl],[4.1.0-beta1])

AM_INIT_AUTOMAKE

AC_SUBST(INSTALL_KONQ)
AC_SUBST(INSTALL_DOLP)
AC_SUBST(INSTALL_D3LP)
AC_SUBST(KDEDIR)

AC_PREFIX_DEFAULT(/usr)
AC_PREFIX_PROGRAM(pacpl)
AC_CONFIG_SRCDIR(pacpl)

AC_PROG_INSTALL

AC_PATH_PROG(RM, rm, rm)
AC_PATH_PROG(PERL, perl, perl)
AC_PATH_PROG(POD2MAN, pod2man, pod2man)
AC_PATH_PROG(POD2HTML, pod2html, pod2man)
AC_PATH_PROG(GZIP, gzip, gzip)

########################################
# check for supported encoder/decoders #
########################################
echo ""
AC_CHECK_PROG(LAME, lame, yes)
AC_CHECK_PROG(TOOLAME, toolame, yes)
AC_CHECK_PROG(TWOLAME, twolame, yes)
AC_CHECK_PROG(GOGO, gogo, yes)
AC_CHECK_PROG(BLADEENC, bladeenc, yes)
AC_CHECK_PROG(OGGENC, oggenc, yes)
AC_CHECK_PROG(OGGDEC, oggdec, yes)
AC_CHECK_PROG(OPUSENC, opusenc, yes)
AC_CHECK_PROG(OPUSDEC, opusdec, yes)
AC_CHECK_PROG(AFTEN, aften, yes)
AC_CHECK_PROG(SPEEXENC, speexenc, yes)
AC_CHECK_PROG(SPEEXDEC, speexdec, yes)
AC_CHECK_PROG(FLAC, flac, yes)
AC_CHECK_PROG(MAC, mac, yes)
AC_CHECK_PROG(SHORTEN, shorten, yes)
AC_CHECK_PROG(SOX, sox, yes)
AC_CHECK_PROG(FAAC, faac, yes)
AC_CHECK_PROG(FAAD, faad, yes)
AC_CHECK_PROG(FFMPEG, ffmpeg, yes)
AC_CHECK_PROG(MPLAYER, mplayer, yes)
AC_CHECK_PROG(LA, la, yes)
AC_CHECK_PROG(BONK, bonk, yes)
AC_CHECK_PROG(MPCENC, mpcenc, yes)
AC_CHECK_PROG(MPCDEC, mpcdec, yes)
AC_CHECK_PROG(OFF, off, yes)
AC_CHECK_PROG(OFR, ofr, yes)
AC_CHECK_PROG(OFS, ofs, yes)
AC_CHECK_PROG(LPAC, lpac, yes)
AC_CHECK_PROG(TTAENC, ttaenc, yes)
AC_CHECK_PROG(WAVPACK, wavpack, yes)
AC_CHECK_PROG(WVUNPACK, wvunpack, yes)
AC_CHECK_PROG(SNDFILE, sndfile-convert, yes)
AC_CHECK_PROG(MPLAYER, mplayer, yes)


###################################
# Check for required perl modules #
###################################

echo ""
echo "checking for required perl modules..."
echo ""

AX_PROG_PERL_MODULES(Getopt::Long
			 File::Basename
			 File::Find
			 File::Spec::Functions
			 CDDB
			 CDDB_get
			 Ogg::Vorbis::Header
			 Audio::Musepack
			 Audio::APETags
			 Audio::WMA
			 MP3::Tag 
			 MP4::Info
			 Audio::FLAC::Header , [], AC_MSG_ERROR([ERROR: One or more of the required modules could not be found. See extra/mod-install.sh]))

echo ""
echo "determining which plugins can be installed..."
echo ""

AC_ARG_ENABLE([dolphin],
	[AS_HELP_STRING([--enable-dolphin],[Install Dolphin plugin. [yes/no], default [yes]])],
	[],
	[enable_dolphin=yes])
	
AC_CHECK_PROG([DOLP],[dolphin],[yes])
AM_CONDITIONAL([INSTALL_DOLP], [test x$enable_dolphin = xyes])

if test "x$DOLP" = "xyes" -a "x$enable_dolphin" != "xno"; then
	INSTALL_DOLP=true
else
	INSTALL_DOLP=false
fi

AC_ARG_ENABLE([konqueror],
	[AS_HELP_STRING([--enable-konqueror],[Install Konqueror plugin. [yes/no], default [yes]])],
	[],
	[enable_konqueror=yes])
	
AC_CHECK_PROG([KONQ],[konqueror],[yes])
AM_CONDITIONAL([INSTALL_KONQ], [test x$enable_konqueror = xyes])

if test "x$KONQ" = "xyes" -a "x$enable_konqueror" != "xno"; then
	INSTALL_KONQ=true
else
	INSTALL_KONQ=false
fi


if test "x$INSTALL_DOLP" = "xtrue" -o "x$INSTALL_KONQ" = "xtrue"; then
	plugins=1
else
	plugins=0
fi

if test "$plugins" = "1"; then

	AC_CHECK_PROG([KDIALOG],[kdialog],[yes])
	
	if test "$KDIALOG" != "yes"; then
	echo ""
	echo "WARNING:"
	echo ""
	echo "kdialog could not be found in your PATH."
	echo ""
	echo "this application can be found in the kdebase package."
	echo "service menus will not work correctly without this program."
	echo ""
	echo "If you are building pacpl in a chroot environment, or if you"
	echo "are certain kdialog is installed, you can ignore this warning."
	echo ""
	fi
fi

echo ""

AC_ARG_VAR([KDEDIR], [root directory of your KDE installation (default /usr)])
AC_ARG_VAR([DESTDIR], [root installation directory (default /)])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT()

if test x$plugins = x1; then

	echo ""
	echo "install plugins for the following: "
	echo ""

	if test x$INSTALL_KONQ = xtrue; then
		echo "-- konqueror (yes)"
	else
		echo "-- konqueror (no)"
	fi
	
	if test x$INSTALL_DOLP = xtrue; then
		echo "-- dolplhin (yes)"
	else
		echo "-- dolphin (no)"
	fi
fi

if test x$plugins = x0; then

	echo ""
	echo ""
	echo "all plugins have been disabled..."
	echo ""
fi

echo ""
echo "Configure finished successfully.  Run 'make && make install' to complete the installation process"
echo ""

exit 1