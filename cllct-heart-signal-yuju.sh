#!/bin/bash

DT_PBLSH=2017-10-27
DTS_SINC=`CALCULATE_DATES_SINCE ${DT_TODAY} ${DT_PBLSH}`
VD_TITLE="heart signal"
VD_SINGR="yuju"
VD_ID=A6-T9TVHaEI
LOG_FILE="tsv-`echo ${VD_TITLE}|tr ' ' '-'`-`echo ${VD_SINGR}|tr ' ' '-'`.log"


VD_VC=`curl -sL -A ${AGENT_ID} "https://www.youtube.com/watch?v=${VD_ID}" |grep ytplayer|grep video_id |grep ${VD_ID} |grep view_count |sed -n 's/.*view_count":"\([0-9]*\)".*/\1/p' `

/bin/echo -e "${DT_TODAY}\t${DTS_SINC}\t${VD_ID}\t${VD_TITLE}\t${VD_SINGR}\t${VD_VC}" >> ${LOG_FILE}


