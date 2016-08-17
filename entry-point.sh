#!/bin/sh

export APACHE_CONFDIR=/etc/apache2
export APACHE_ENVVARS=$APACHE_CONFDIR/envvars

if [ -f /etc/default/apache2 ] ; then
	. /etc/default/apache2
fi

PIDFILE=$(. $APACHE_ENVVARS && echo $APACHE_PID_FILE)
VERBOSE=no

. $APACHE_ENVVARS

exec $@


