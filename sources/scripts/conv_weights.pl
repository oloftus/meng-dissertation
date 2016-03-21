#!/usr/bin/perl

use strict;
use warnings;

my $INT_FP_WIDTH = 5;
my $FRACT_FP_WIDTH = 10;
my $FORMAT = 'x'; # b/x
my $PAD_HIGH = 0;
my $PAD_LOW = 0;

open my $fh, "<", "weights.txt" or die "Couldn't open file";

sub bin2dec {
  return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}

while (<$fh>) {
  chomp;
  
  if ($_ =~ /^#/ or $_ =~ /^$/) {
    print $_, "\n";
    next;
  }
  
  my $nve = $_ =~ /^-/;
  my ($int, $frac) = split(/\./, ($nve ? substr($_, 1, length($_)) : $_));
  $frac = "0.".$frac;
  
  my $int_str = sprintf("%0${INT_FP_WIDTH}b", $int);
  $int = substr($int_str, length($int_str)-$INT_FP_WIDTH-1, length($int_str));
  
  my $frac_str = "";
  foreach my $pos (1..$FRACT_FP_WIDTH) {
    my $val = 1 / 2 ** $pos;
    
    if ($frac - $val < 0) {
      $frac_str .= "0";
    }
    else {
      $frac_str .= "1";
      $frac -= $val;
    }
  }
  
  my $num_str;
  if ($nve) {
    $int_str =~ tr/0/X/;
    $int_str =~ tr/1/0/;
    $int_str =~ tr/X/1/;
    $frac_str =~ tr/0/X/;
    $frac_str =~ tr/1/0/;
    $frac_str =~ tr/X/1/;
    
    $int_str = "1".$int_str;
  }
  else {
    $int_str = "0".$int_str;
  }
  
  $num_str = $int_str.$frac_str;
  my $num_dec = bin2dec($num_str) + 1;
  $num_dec = sprintf("%0@{[1 + $INT_FP_WIDTH + $FRACT_FP_WIDTH]}b", $num_dec);
  $int_str = substr($num_dec, 0, length($int_str));
  $frac_str = substr($num_dec, length($int_str), length($frac_str));
  
  if ($FORMAT eq 'x') {
    my $low = do {my $x=""; for (1..$PAD_LOW) {$x.="0"}; $x};
    my $high= do {my $x=""; for (1..$PAD_HIGH) {$x.="0"}; $x};
    print sprintf("0x%x", bin2dec($high.$int_str)), ".";
    print sprintf("0x%x", bin2dec($frac_str.$low)), "\n";
  }
  else {
    print $int_str, ".", $frac_str, "\n";
  }
}
