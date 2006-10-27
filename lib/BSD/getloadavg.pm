package BSD::getloadavg;
use 5.006002;
use strict;
use warnings;

our $VERSION = sprintf "%d.%02d", q$Revision: 0.2 $ =~ /(\d+)/g;
our $DEBUG   = 0;
require Exporter;
our @ISA         = qw(Exporter);
our @EXPORT      = qw( getloadavg );
our %EXPORT_TAGS = ( 'all' => [ @EXPORT ] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );
require XSLoader;
XSLoader::load('BSD::getloadavg', $VERSION);

# Preloaded methods go here.

sub getloadavg(){ 
    my $retval = xs_getloadavg();
    if ($DEBUG){
	eval {
	    require Devel::Peek;
	    Devel::Peek::Dump($retval);
	}
    }
    wantarray ? @{ $retval } : $retval->[0];
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

BSD::getloadavg - Perl Interface to getloadavg (3)

=head1 SYNOPSIS

  use BSD::getloadavg;
  my @loadavg = getloadavg();

=head1 DESCRIPTION

This module allows you to access load average without invoking uptime(1).  Instead of

  my @loadavg = (qx(uptime) =~ /([\.\d]+)\s+([\.\d]+)\s+([\.\d]+)/);

You can simply

  use BSD::getloadavg;
  my @loadavg = getloadavg();

=head1 COMPATIBILITY

Though named BSD::getloadavg, this module also works on Linux and
other platforms that support getloadavg.  To find if your platform
supports this module, Just

  nm /usr/lib/libc.* | grep getloadavg

=head1 BENCHMARK

You can run benchmark with t/benchmark.pl.  Here is the result in my platforms.

=over 2

=item MacBook Pro 2GHz, Mac OS X 10.4.8

  Benchmark: running XS, command for at least 3 CPU seconds...
          XS:  3 wallclock secs ( 1.40 usr +  1.60 sys =  3.00 CPU) @ 69808.00/s (n=209424)
     command: 16 wallclock secs ( 0.58 usr  2.77 sys +  2.30 cusr  9.68 csys = 15.33 CPU) @ 1060.60/s (n=3553)
           Rate command      XS
  command  1061/s      --    -98%
  XS      69808/s   6482%      --

=item Dual Xeon 2.8GHz, FreeBSD 6-Stable

  Benchmark: running XS, command for at least 3 CPU seconds...
          XS:  4 wallclock secs ( 2.49 usr +  0.58 sys =  3.07 CPU) @ 139022.98/s (n=426844)
     command: 11 wallclock secs ( 0.19 usr  2.98 sys +  2.34 cusr  7.12 csys = 12.62 CPU) @ 919.07/s (n=2908)
              Rate command      XS
  command    919/s      --    -99%
  XS      139023/s  15026%      --

=back

=head2 EXPORT

getloadavg()

=head1 SEE ALSO

=over 2

=item getloadavg(5)

Also available as
L<http://www.freebsd.org/cgi/man.cgi?query=getloadavg&sektion=3>.
Since getloadavg is in libc in most platform, Makefile.PL needed no
tweaking.  If you find a platform that does not have getloadavg in
libc, please report.

=item L<Sys::CpuLoad>

This module accesses load average via /proc or uptime command.
Therefore the performance is analogous to the benchmark above.

=item L<BSD::Sysctl>

Seems like the most versatile module in this arena.  Unfortunately
most-platform dependent also.  Works only on FreeBSD as of Version
0.06.

=back

=head1 AUTHOR

Dan Kogai, E<lt>dankogai@dan.co.jpE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Dan Kogai

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
