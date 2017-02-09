#!perl
use warnings;
use strict;
use 5.014;
=head1 Tarea de conicidencias con url.
=head2 PERL
=item
 Busca coincidencias de el archivo datos.txt y las arroja en el
 archivo url.txt, lo genera :D
=cut

my $totalurl;
my $totalemail;
my $totalip;
my $totaldomain;
my @urls;
my @emails;
my @ips;
my @domains;

=item
 Abrimos los archivos para lectura y escritura,
 FCG abre como lectura el archivo datos.txt
 FO abre un archivo como escritura llamado "url.txt"
  si no existe lo generara.
=cut
my $num_args = @ARGV;
if ($num_args !=1) {
    print "\nError: necesita ingresar la ruta del archivo como argumento.\n";
    exit;
}
my $fichero=$ARGV[0];
open(FCG,"<",$fichero) or die "No se puede\n";
open(FOU,">","url.txt") or die "No se puede crear\n";
open(FOD,">","domain.txt") or die "No se puede crear\n";
open(FOE,">","email.txt") or die "No se puede crear\n";
open(FOI,">","ip.txt") or die "No se puede crear\n";

while(<FCG>){
  chomp;
  if(/(https?:\/\/[^\s]*\/)/){
    push(@urls,$1);
    #print $1,"\n";
    print FOU $1,"\n"
  }
  if(/(https?:\/\/[w]{3}\.[^\s]*\/)/){
    push(@urls,$1);
    #print $1,"\n";
    print FOU $1,"\n"
  }
  if(/([a-zA-Z0-9i|\.|-|_]*@[a-zA-Z0-9|\.|-|_]*\.[a-zA-Z]{2,4})/){
    push(@emails,$1);
    #print $1,"\n";
    print FOE $1,"\n"
  }  
  if(/([0-9]{1-3}\.)/){
    #print $1,"\n";
    print FOI $1,"\n"
  }
  if(/([a-zA-Z0-9i|\.|-|_]*@)([a-zA-Z0-9|\.|-|_]*\.[a-zA-Z]{2,4})/){
    push(@domains,$2);
    #print $2,"\n";
    print FOD $2,"\n"
  }
  if(/(https?:\/\/)([w]{3}\.)([a-zA-Z0-9|-|_|\.]*\.[a-zA-Z]{2,4})/){
    push(@domains,$3);
    #print $3,"\n";
    print FOD $2,"\n"
  }

}
$totalurl=@urls;
$totalemail=@emails;
$totaldomain=@domains;
print "Total de coincidencias con url's: ",$totalurl,"\n";
print "Total de coincidencias con emails: ",$totalemail,"\n";
print "Total de coincidencias con dominios: ",$totaldomain,"\n";
close(FCG); 
close(FOU);
close(FOD);
close(FOE);
close(FOI);
