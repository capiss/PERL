#!perl

=head1 Tarea1 
=head2 Fizzbuzz
 Esto es pod, mi programa hace el Fizzbizz.
 Cada que un numero es multiplo de 5 y de 3
 escribirá la palabra "FiizBizz", Si solo 
 es multiplo de 3 escribirá "Fizz", si solo
 es multiplo de 5 escribirá "Bizz", si no 
 es multiplo de ninguno de los anteriores 
 escribira el número que corresponde.
=cut

use warnings;
use strict;

my @numeros=(1..30);

foreach (@numeros){
  if( $_ % 5 == 0 and $_ % 3 == 0) {
    print "Fizz Bizz\n";
  }elsif($_%3==0){
    print "Fizz\n";
  }elsif($_%5==0){
    print "Bizz\n";
  }else {
    print $_,"\n";
  }
}


