package Config::Do;

use strict;
use warnings;
use Exporter::Lite;
use Carp;

our $VERSION = '0.01';

our @EXPORT = qw(config_do);

sub config_do ($) {
	my $filename = shift;
	my $hash = do "$filename";

	croak $@ if $@;
	croak $! unless defined $hash;
	unless (ref($hash) eq 'HASH') {
		croak "$filename does not return HashRef.";
	}

	wantarray ? %$hash : $hash;
}

1;
__END__

=encoding utf8

=head1 NAME

Config::Do - Just do it.

=head1 SYNOPSIS

  use Config::Do;

  my $hash = config_do('config.pl');


=head1 DESCRIPTION

Config::Do is just a utility module for 'do' file.

'do EXPR' function of Perl core is not sane because it does not die when the file contains parse error or is not found.

This module provides config_do function which croaks errors and ensures that the returned value is HashRef.

=head1 AUTHOR

cho45 E<lt>cho45@lowreal.netE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
