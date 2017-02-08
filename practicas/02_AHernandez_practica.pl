#!perl

use warnings;
use strict;
=head1 Calculadora con subrutinas.
=cut

=head2 Subrutina Menu
=item
 Muestra el menu para la operacion a realizar,
 Recibe por parte del usuario, la opcion a realizar
 y los dos numeros a operar.
=cut
sub menu{
  my $A;
  my $B;
  my $seleccion;
  print "¿Qué operación deseas realizar?\n";
  print "1.- Suma (A + B)\n";
  print "2.- Resta (A - B)\n";
  print "3.- Multiplicación (A x B)\n";
  print "4.- division (A / B)\n";
  chomp($seleccion=<STDIN>);
  print "Ingresa los números:\n";
  chomp($A=<STDIN>);
  chomp($B=<STDIN>);
  if($seleccion=~/[0-4]{1}/){
    if($A=~/[0-9]+/ and $B=~/[0-9]+/) {
      if($seleccion==1){ suma($A,$B);}
      if($seleccion==2){ resta($A,$B);}
      if($seleccion==3){ multiplicacion($A,$B);}
      if($seleccion==4){ division($A,$B);}
    }else {
     print "No has ingresado un número es válido\n";
    }
  }
}

sub suma(){
  print $_[0]+$_[1],"\n";
}

sub resta(){
  print $_[0]-$_[1],"\n";
}
sub multiplicacion(){
  print $_[0]*$_[1],"\n";
}

sub division(){
  if($_[1]==0){ print "Error: División sobre cero.\n";}
  else{  print $_[0]/$_[1],"\n";}
}

&menu();
