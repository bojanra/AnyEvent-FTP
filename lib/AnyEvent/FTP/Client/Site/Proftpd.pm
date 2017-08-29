package AnyEvent::FTP::Client::Site::Proftpd;

use strict;
use warnings;
use 5.010;
use Moo;

extends 'AnyEvent::FTP::Client::Site::Base';

# ABSTRACT: Site specific commands for Proftpd
# VERSION

=head1 SYNOPSIS

 use AnyEvent::FTP::Client;
 my $client = AnyEvent::FTP::Client->new;
 $client->connect('ftp://proftpdserver')->cb(sub {
   $client->site->proftpd->symlink('foo', 'bar');
 });

=head1 DESCRIPTION

This class implements site specific commands for the Proftpd server.
The implementation may be incomplete, and the documentation definitely is.
Patches are welcome to fix this.

=head1 METHODS

=head2 utime

 $client->site->proftpd->utime( $arg1, $arg2 );

Execute C<SITE UTIME> command.

=head2 mkdir

 $client->site->proftpd->mkdir( $arg1 );

Execute C<SITE MKDIR> command.

=head2 rmdir

 $client->site->proftpd->rmdir( $arg1 );

Execute C<SITE RMDIR> command.

=head2 symlink

 $client->site->proftpd->symlink( $arg1, $arg2 );

Execute C<SITE SYMLINK> command.

=cut

sub utime   { shift->client->push_command([SITE => "UTIME $_[0] $_[1]"]   ) }
sub mkdir   { shift->client->push_command([SITE => "MKDIR $_[0]"]         ) }
sub rmdir   { shift->client->push_command([SITE => "RMDIR $_[0]"]         ) }
sub symlink { shift->client->push_command([SITE => "SYMLINK $_[0] $_[1]"] ) }

=head2 ratio

 $client->site->proftpd->ratio;

Execute C<SITE RATIO> command.

=head2 help

 $client->site->proftpd->help( $arg1 );

Execute C<SITE HELP> command.

=head2 chgrp

 $client->site->proftpd->chgrp( $arg1, $arg2 );

Execute C<SITE CHGRP> command.

=head2 chmodk

 $client->site->proftpd->chmodk( $arg1, $arg2 );

Execute C<SITE CHMOD> command.

=cut

sub ratio   { shift->client->push_command([SITE => "RATIO"]               ) }
sub quota   { shift->client->push_command([SITE => "QUOTA"]               ) }
sub help    { shift->client->push_command([SITE => "HELP $_[0]"]          ) }
sub chgrp   { shift->client->push_command([SITE => "CHGRP $_[0] $_[1]"]   ) }
sub chmod   { shift->client->push_command([SITE => "CHMOD $_[0] $_[1]"]   ) }

1;
