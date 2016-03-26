#!/usr/bin/perl

use strict;
use warnings;

my $SHIFT_WIDTH = 3;

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
  my $lt1 = $int == "0";
  
  print sprintf("0x%x\n",
    bin2dec(
      ($nve ? "1" : "0").
      ($lt1 ? "1" : "0").
      sprintf("%0${SHIFT_WIDTH}b", substr(sprintf("%.0f ",
        log($lt1 ? $frac : $int)/log(2)), ($lt1 ? 1 : 0), -1))
    )
  );
}
