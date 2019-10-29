#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/extlib/lib/perl5";
use lib "$FindBin::Bin/extlib";
use lib "$FindBin::Bin/lib";
use utf8;
use Encode;

use List::Util qw/shuffle/;

use Data::Dumper;

my $text = q(I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind .);

my $output = &shuffletext( $text );
print "$output","\n";

sub shuffletext{
    my ( $input_text ) = @_;
    my @input_data = split(/ /, $input_text );
    my @output_data = ();
    foreach my $word ( @input_data ){
        if ( length($word) > 4 ){
            my @word_split = split(//, $word);
            my $first_word = shift( @word_split );
            my $last_word = pop( @word_split );
            my @word_shuffle = shuffle(@word_split);
            unshift(@word_shuffle,$first_word);
            push(@word_shuffle,$last_word);
            my $shuffle_text = join('', @word_shuffle);
            push @output_data, $shuffle_text;
        } else {
            push @output_data, $word;
        }
    }
    my $output_text = join(' ', @output_data);
    return $output_text;
}