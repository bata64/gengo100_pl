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

my $str1 = 'I am an NLPer';

my $ref_word = &ngram( $str1, 'word', 2 );
my $ref_char = &ngram( $str1, 'char', 2 );

my @Word_bigram = @$ref_word;
my @Char_bigram = @$ref_char;

warn Dumper @Word_bigram;
warn Dumper @Char_bigram;

sub ngram{
    my ( $text, $type, $Num ) = @_;
    my @Input = ();
    my @Output = ();
    if ( $type =~ /^word$/ ){
        @Input = split(/ /, $text);
    } elsif ( $type =~ /^char$/ ){
        @Input = split(/ |/, $text);
    }
    if ( @Input < $Num ){
        die("N:$Num is Too Large.");
    }

    if ( $Num == 1 ){
        return \@Input;
    } else {
        my $data;
        for ( my $i = 0; $i < $#Input; $i++ ){
            my $j;
            $data = $Input[$i];
            for ( $j = 1; $j < $Num; $j++ ){
                $data = $data . $Input[$i + $j];
            }
            push @Output, $data;
            if ( $i + $j > $#Input ){
                last;
            }
        }
        return \@Output;
    }
}