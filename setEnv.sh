#!/bin/bash

#### PERLBFEW WORKS IN BASH ####
source /home/pcific/kpopytvc/perl/etc/bashrc  >/dev/null
/home/pcific/kpopytvc/perl/bin/perlbrew init  >/dev/null
/home/pcific/kpopytvc/perl/bin/perlbrew switch perl-5.20.3  >/dev/null

#### COMMON ENV ####
YTVC_DIR=/home/pcific/kpopytvc
DT_TODAY=`date --date=today --iso-8601=date`
DT_YSTDY=`date --date=yesterday --iso-8601=date`
export YTVC_DIR DT_TODAY DT_YSTDY 

alias godom='cd $YTVC_DIR' && cd $YTVC_DIR

