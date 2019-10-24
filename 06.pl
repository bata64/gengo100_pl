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

my $str1 = 'paraparaparadise';
my $str2 = 'paragraph';

my $ref_x = &ngram( $str1, 'char', 2 );
my $ref_y = &ngram( $str2, 'char', 2 );

my @array_x = @$ref_x;
my @array_y = @$ref_y;

# 和集合
my %cnt = ();
my @array_wa = grep { ++$cnt{$_} == 1 } (@array_x, @array_y);

# 差集合
my %cnt_sa = ();
map { $cnt_sa{$_}-- } @array_y;
my @array_sa = grep { ++$cnt_sa{$_} == 1 } @array_x;

# 積集合
%cnt = ();
my @array_seki = grep { ++$cnt{$_} == 2 } (@array_x, @array_y);

print encode('utf8','配列X：');
foreach my $text ( @array_x ){
    print "$text"," ";
}
print "\n";

print encode('utf8','配列y：');
foreach my $text ( @array_y ){
    print "$text"," ";
}
print "\n";

print encode('utf8','和集合：');
foreach my $text ( @array_wa ){
    print "$text"," ";
}
print "\n";

print encode('utf8','差集合：');
foreach my $text ( @array_sa ){
    print "$text"," ";
}
print "\n";

print encode('utf8','積集合：');
foreach my $text ( @array_seki ){
    print "$text"," ";
}
print "\n";

# 'se'が含まれるか
foreach my $se ( @array_x ){
    if ( $se =~ /^se$/ ){
        print "X complains se.","\n";
    }
}

foreach my $se ( @array_y ){
    if ( $se =~ /^se$/ ){
        print "Y complains se.","\n";
    }
}

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