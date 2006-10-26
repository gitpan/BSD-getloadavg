#
# $Id: BSD-getloadavg.t,v 0.1 2006/10/26 11:20:29 dankogai Exp dankogai $
#
use strict;
use warnings;

use Test::More tests => 5;
#use Test::More qw/no_plan/;
BEGIN { use_ok('BSD::getloadavg') };
my @loadavg =   getloadavg();
is scalar @loadavg, 3;
like $loadavg[0], qr/^\d+\.\d+$/;
like $loadavg[1], qr/^\d+\.\d+$/;
like $loadavg[2], qr/^\d+\.\d+$/;

