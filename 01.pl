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

my $str = 'パタトクカシーー';
my $word_one = substr($str, 0, 1);
my $word_three = substr($str, 2, 1);
my $word_five = substr($str, 4, 1);
my $word_seven = substr($str, 6, 1);
my $word_convine = $word_one . $word_three . $word_five . $word_seven;
utf8::encode($word_convine);
print "$word_convine","\n";