
use strict;
use warnings;

use Test::More;
use Test::Fatal;

use Config::Do;

like exception { config_do('unknown_file') }, qr/No such file or directory/;
like exception { config_do('t/data/parse_error.pl') }, qr{syntax error at t/data/parse_error.pl line 2, near ";;"};
like exception { config_do('t/data/no_values.pl') }, qr{t/data/no_values.pl does not return HashRef.};
is exception { config_do('t/data/valid.pl') }, undef;

my $config = config_do('t/data/valid.pl');
is_deeply $config, { foo => 'bar' };

done_testing;
