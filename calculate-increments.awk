#!/usr/bin/awk -f 

BEGIN {
  FS="\t";
  DT_YSTDY=strftime("%Y-%m-%d", systime()-86400);
  DT_TODAY=strftime("%Y-%m-%d", systime());
  VC_YSTDY=0;
}
{
  if($1==DT_YSTDY){
    VC_YSTDY=$6
  };
  if($1==DT_TODAY){
    VC_TODAY=$6 ;
  }
  VC_INCRE = VC_TODAY - VC_YSTDY ;
}
END {
  if( VC_TODAY > 0 ){
    print VC_INCRE  ;
  }
}


