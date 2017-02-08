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
my @resultado;
my %MenuHash=(
 ayuda           =>  \&ayuda,
 suma            =>  \&suma,
 resta           =>  \&resta,
 multipliacion   =>  \&multi,
 division        =>  \&divi,
 modulo          =>  sub {
                       return $_[0] % $_[1];
                     },
);
my $num_args = @ARGV;
if ($num_args >=1) {
  if(lc $ARGV[0] eq "ayuda"){
   &ayuda;
  }
  exit;
}
sub ayuda{
  print "\noperación => Forma que aplica. \n";
  print "------------------------------------------\n";
  print "suma      => Suma (A + B)\n";
  print "resta     => Resta (A - B)\n";
  print "multipliacion =>  Multiplicación (A x B)\n";
  print "division  => division (A / B)\n";
  print "modulo    => Modulo (A / B)\n";
  print "salir     => Modulo (A / B)\n";  

}
sub menu{
  my $seleccion;
  my $A;
  my $B;
  print "Ingresa la operacion a realizar: \n";
  chomp($seleccion=<STDIN>);
  if($seleccion eq "salir"){
    print "Tus resultados: \n";
    for(@resultado){
     print $_,", ";
    }
    print "\n";
    exit 
  }elsif($MenuHash{$seleccion}){
    print "Ingresa los números:\n";
    chomp($A=<STDIN>);
    chomp($B=<STDIN>);
    my $resultado=$MenuHash{$seleccion}->($A,$B);
    print "resultado: ",$resultado,"\n";
    push(@resultado,$resultado);
  }
}

sub suma{
  return $_[0]+$_[1];
}

sub resta{
  print $_[0]-$_[1],"\n";
}
sub multiplicacion{
  print $_[0]*$_[1],"\n";
}

sub division{
  if($_[1]==0){ warn "Error: División sobre cero.\n";}
  else{ 
    return $_[0]/$_[1],"\n";
  }
}

while(1){
  &menu();
}
