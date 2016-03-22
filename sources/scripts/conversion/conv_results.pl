#!/usr/bin/perl

use strict;
use warnings;

my $INT_FP_WIDTH = 1;
my $FRACT_FP_WIDTH = 7;

open my $fh, "<", "raw.txt" or die "Couldn't open file";

sub bin2dec {
  return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}

while (<$fh>) {
  chomp;
  
  if ($_ =~ /^,/) { next; }
  
  print join(",", map {
      my $bin = sprintf("%0@{[$INT_FP_WIDTH+$FRACT_FP_WIDTH]}b", hex($_));
    
      bin2dec(substr($bin, 0, $INT_FP_WIDTH)) +
      do {
        my $frac_bin = substr($bin, $INT_FP_WIDTH, $FRACT_FP_WIDTH);
    
        my $frac_num = 0;
        foreach my $pos (0..$FRACT_FP_WIDTH-1) {
          my $add = 1 / 2 ** ($pos+1);

          if (substr($frac_bin, $pos, 1) == "1") {
            $frac_num += $add;
          }
        }
      
        $frac_num;
      }
    } $_ =~ /0x([0-9A-F]+),/g), "\n";
}
