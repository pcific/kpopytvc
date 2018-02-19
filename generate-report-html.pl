#!/usr/bin/env perl 

#use strict;
#use warnings;

use HTML::Template;

my $tmplt_text = <<'__TMPL__'
<body>
<table cellpadding=4 >
  <TMPL_LOOP ROWS><tr><td><TMPL_VAR vd_title></td><td><TMPL_VAR vd_singer></td><td><TMPL_VAR days_since></td><td><TMPL_VAR vc_today></td><td><TMPL_VAR vc_incre></td></tr>
  </TMPL_LOOP>
</table>
</body>
__TMPL__
;

my $rows = [];

my $fh;
open $fh, 'report.txt' or die "fail! $!";

while (my $line = <$fh>) {
  chomp $line;
  next if $line =~ /^\#/ || $line =~ /^\-{4,}/ || $line =~ /^\s*$/ ;
  my ($vd_title, $vd_singer, $days_since, $vc_today, $vc_incre ) = split /\s{2,}/, $line;
  push @{$rows}, { vd_title => $vd_title , vd_singer => $vd_singer , days_since => $days_since , vc_today => $vc_today , vc_incre => $vc_incre } ;
}
close $fh ;

my $tmplt = HTML::Template->new(scalarref => \$tmplt_text , option => 'value'  );
#$tmplt->param(DATE => "2018-01-01" );
$tmplt->param(ROWS => $rows);
print $tmplt->output;


