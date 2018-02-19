#!/bin/sh

[ -z "$YTVC_DIR" ] && source /home/pcific/kpopytvc/setEnv.bash ;
cd ${YTVC_DIR}

AGENT_ID="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"
export AGENT_ID

for CLLCT_SH in `ls -1 cllct-*.sh`
do
  ./$CLLCT_SH >> error.log 2>&1
done

