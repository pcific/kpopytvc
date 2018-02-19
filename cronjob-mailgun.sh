#!/bin/bash

[ -z "$YTVC_DIR" ] && source /home/pcific/kpopytvc/setEnv.bash ;
cd ${YTVC_DIR}

./generate-report-txt.sh > report.txt
if [ ! -s ./report.txt ] ; then
 exit 1
fi

./generate-report-html.pl > report.html

MG_API_KEY=`cat mailgun-apikey.secure`
MG_DOMAIN_NAME=`cat mailgun-domain.secure`.mailgun.org
MAIL_ADDR=`cat mailaddr.secure`
MG_SUBJECT="ytvc daily report ${DT_TODAY}"
MG_TEXT=`cat report.txt`
MG_HTML=`cat report.html|tr -d '\n\r\t'`

#### OLD MAIL GUN ####
curl -s --user "api:${MG_API_KEY}" \
 https://api.mailgun.net/v3/${MG_DOMAIN_NAME}/messages \
 -F "from=kpopytvc <postmaster@${MG_DOMAIN_NAME}>" \
 -F "to=${MAIL_ADDR}" \
 -F "subject=${MG_SUBJECT}" \
 --form-string "html=$MG_HTML"


