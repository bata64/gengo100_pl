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

my $x = '12';
my $y = '気温';
my $z = '22.4';

my $text = &x_y_z($x, $y, $z);

print encode('utf8',$text),"\n";

sub x_y_z{
    my ( $input_x, $input_y, $input_z ) = @_;
    my $output = "${input_x}時の${input_y}は$input_z";
     return $output;
}