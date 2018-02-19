#!/bin/bash

YTVC_DIR=/home/pcific/kpopytvc
DT_TODAY=`date --date=today --iso-8601`

cd ${YTVC_DIR}

printf "# ${DT_TODAY}\n" 
echo '--------------------------------------------------------------' 
for TSV_FILE in "tsv-secret-garden-ohmygirl.log" "tsv-first-love-yuju.log" "tsv-heart-signal-yuju.log" "tsv-hold-your-hand-eunha.log"
do
  VC_INCRE=`./calculate-increments.awk $TSV_FILE`
  tail -n 3 $TSV_FILE | grep "${DT_TODAY}" | while IFS=$'\t' read -r DT DTS_SINC VD_ID VD_TITLE VD_SINGR VC_TODAY ; do
    LC_NUMERIC=en_US.utf8 printf "%-20s %-9s %3sd %'13.0f %'+12.0f\n" "${VD_TITLE}" "${VD_SINGR}" ${DTS_SINC} ${VC_TODAY} ${VC_INCRE} 
  done
done
echo '--------------------------------------------------------------' 
echo ''



