#
# $Id: BSD-getloadavg.t,v 0.2 2006/10/27 04:11:25 dankogai Exp dankogai $
#
use strict;
use warnings;

use Test::More tests => 5;
#use Test::More qw/no_plan/;
BEGIN { use_ok('BSD::getloadavg') };
my @loadavg =   getloadavg();
is scalar @loadavg, 3, join(", ", @loadavg);
like $loadavg[0], qr/^\d+\.\d+$/, $loadavg[0];
like $loadavg[1], qr/^\d+\.\d+$/, $loadavg[1];
like $loadavg[2], qr/^\d+\.\d+$/, $loadavg[2];

