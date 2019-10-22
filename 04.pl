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

my $str1 = 'Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.';
my $num = 1;
my %hash;

my @array1 =split(/ |, |\. |\./, $str1);
foreach my $txt ( @array1 ){
    if ( $num =~ /^(1|5|6|7|8|9|15|16|19)$/){
        $hash{$num} = substr($txt, 0, 1);
    } else {
        $hash{$num} = substr($txt, 0, 2);
    }
    $num++;
}

foreach my $key ( sort {$a <=> $b} keys %hash ){
    print "$key $hash{$key}\n";
}