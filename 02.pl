#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/extlib/lib/perl5";
use lib "$FindBin::Bin/extlib";
use lib "$FindBin::Bin/lib";
use utf8;
use Encode;

use List::MoreUtils ':all';

use Data::Dumper;

my $str1 = 'パトカー';
my $str2 = 'タクシー';

my @array1 = split(//, $str1);
my @array2 = split(//, $str2);

my @z = mesh @array1, @array2;

foreach my $txt ( @z ){
    chomp($txt);
    utf8::encode($txt);
    print "$txt";
}
print "\n";
