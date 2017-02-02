#!perl

use warnings;
use strict;

my @numeros=(1..10);
my @numerospares=();
my $i=0;

foreach(@numeros){
  if( $_%2 == 0){
    $numerospares[$i]=$_;
    print $_,"\n";
    $i=$i+1;
  }
}

print @numerospares;
