package BSD::getloadavg;
use 5.006002;
use strict;
use warnings;

our $VERSION = sprintf "%d.%02d", q$Revision: 0.1 $ =~ /(\d+)/g;

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

=head2 EXPORT

getloadavg()

=head1 SEE ALSO

getloadavg(5), L<http://www.freebsd.org/cgi/man.cgi?query=getloadavg&sektion=3>

=head1 AUTHOR

Dan Kogai, E<lt>dankogai@dan.co.jpE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Dan Kogai

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
