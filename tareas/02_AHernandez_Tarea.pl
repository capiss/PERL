#!perl
use warnings;
use strict;
use 5.014;
=head1 Tarea de conicidencias con url
=head2 PERL
=item
 Busca coincidencias de el archivo datos.txt y las arroja en el
 archivo url.txt, lo genera :D
=cut

my @tmp;
my $total;
=item
 Abrimos los archivos para lectura y escritura,
 FCG abre como lectura el archivo datos.txt
 FO abre un archivo como escritura llamado "url.txt"
  si no existe lo generara.
=cut
open(FCG,"<","datos.txt") or die "No se puede\n";
open(FO,">","url.txt") or die "No se puede crear\n";

while(<FCG>){
  chomp;
  if(/(https?:\/\/[^\s]*\/)/){
    push(@tmp,$1);
    #print $1,"\n";
    print FO $1,"\n"
  }
}
$total=@tmp;
print "Total de coincidencias: ",$total;
close(FCG); 
close(FO);
