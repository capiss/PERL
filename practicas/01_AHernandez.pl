#!perl

use warnings;
use strict;

my @numeros=(1..10);
my @numerospares=();

foreach(@numeros){
  if( $_%2 == 0){
    push(@numerospares,$_);
    print $_,"\n";
  }
}
print "\@numerospares: ";
print @numerospares;
