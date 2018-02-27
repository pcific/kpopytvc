#!/bin/bash

[ -z "$YTVC_DIR" ] && source /home/pcific/kpopytvc/setEnv.sh && cd ${YTVC_DIR}

AGENT_ID="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"
export AGENT_ID

#### FUNCTION ####
CALCULATE_DATES_SINCE() {
  # args DT_TODAY 2018-01-31 DT_PBLSH 2018-01-01 return DTS_SINC 30
  # CALCULATE_DATES_SINCE '2018-01-02' '2018-01-01'
  # CALCULATE_DATES_SINCE '2018-01-21' '2018-01-01'
  # CALCULATE_DATES_SINCE '2018-02-01' '2018-01-01'
  # echo $(( ( `date -d "$1" +%s` - `date -d "$2" +%s` )/86400 )) ;
  perl <<__PERL__
  my \$time_today   = `date -d "$1" +%s` ;
  my \$time_publish = `date -d "$2" +%s` ;
  my \$dates_since = int(  ((\$time_today-\$time_publish)/86400) + 0.1  ) ; # trick round up
  print \$dates_since  , "\n" ;
__PERL__
}
export -f CALCULATE_DATES_SINCE

#export -f GET_LOG_FILE_NAME

for CLLCT_SH in `ls -1 cllct-*.sh`
do
  ./$CLLCT_SH >> error.log 2>&1
done

