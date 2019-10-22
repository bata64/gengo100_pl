#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/extlib/lib/perl5";
use lib "$FindBin::Bin/extlib";
use lib "$FindBin::Bin/lib";
use utf8;
use Encode;

use Data::Dumper;

my $str = 'stressed';
my $reverse_str = reverse $str;

print "$reverse_str","\n";