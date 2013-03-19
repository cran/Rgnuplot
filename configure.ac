#configure.ac originaly from
#Package ‘proj4’
#Title A simple interface to the PROJ.4 cartographic projections library
#Author Simon Urbanek <simon.urbanek@r-project.org>

AC_INIT(Rgnuplot, 1.0, jgama@abo.fi)
AC_CONFIG_SRCDIR(src/Rgnuplot.c)

# find R home and set correct compiler + flags
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  AC_MSG_ERROR([cannot determine R_HOME. Make sure you use R CMD INSTALL!])
fi
RBIN="${R_HOME}/bin/R"

# pick all flags for testing from R
: ${CC=`"${RBIN}" CMD config CC`}
: ${CPP=`"${RBIN}" CMD config CPP`}
: ${CFLAGS=`"${RBIN}" CMD config CFLAGS`}
: ${CPPFLAGS=`"${RBIN}" CMD config CPPFLAGS`}
: ${LDFLAGS=`"${RBIN}" CMD config LDFLAGS`}

PKG_CPPFLAGS="-I/usr/include -I. -I./src"
LDFLAGS="-L/usr/lib -L."
PKG_LIBS="-L/usr/lib"

# honor PKG_xx overrides
LIBS="${LIBS} ${PKG_LIBS}"
# for CPPFLAGS we will superfluously double R's flags
# since we'll set PKG_CPPFLAGS with this, but that shouldn't hurt
CPPFLAGS="${CPPFLAGS} ${PKG_CPPFLAGS}"

libandheaderOK=yes
AC_CHECK_HEADERS([gnuplot_i.h],,[libandheaderOK=no])

if test "${libandheaderOK}" = no; then
   AC_MSG_ERROR([gnuplot_i.h not found in standard search locations.

*** if necessary set PKG_CPPFLAGS/PKG_LIBS accordingly.])
fi

AC_MSG_NOTICE([Checking for gnuplot])

AC_CHECK_PROG(GNUPLOT,gnuplot,true,false)
if test $GNUPLOT = "false"; then
  AC_MSG_ERROR([*** gnuplot not found, it should be installed in order for Rgnuplot to work])
fi

AC_ARG_VAR([PKG_CPPFLAGS],[custom C preprocessor flags for packages compilation])
AC_ARG_VAR([PKG_LIBS],[custom libraries for package compilation])

AC_CONFIG_FILES(src/Makevars)
AC_OUTPUT


