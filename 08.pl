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

my $text = 'MEN WANTED for Hazardous Journey. Small wages, bitter cold, long months of complete darkness, constant danger, safe return doubtful. Honor and recognition in case of success. Ernest Shackleton';

my $text_ciphered = &cipher( $text );
print "cipherd text: ","$text_ciphered","\n";

my $text_decript = &cipher( $text_ciphered );
print "decripted text: ","$text_decript","\n";

sub cipher{
    my ( $input_text ) = @_;
    my @input_data = split(//, $input_text );
    my @output_data = ();
    foreach my $word ( @input_data ){
        if ( $word =~ /^[a-z]$/ ){
            my $code = ord($word);
            my $code_cipher = 219 - $code;
            my $word_cipher = chr( $code_cipher );
            push @output_data, $word_cipher
        } else {
            push @output_data, $word
        }
    }
    my $output_text = join('', @output_data);
    return $output_text;
}