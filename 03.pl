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

my $str1 = 'Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.';
my @Count_List = ();

my @array1 =split(/ |, |\./, $str1);
foreach my $txt ( @array1 ){
    my $count = length( $txt );
    push @Count_List, $count; 
}

foreach my $txt ( @Count_List ){
    print "$txt","\n";
}