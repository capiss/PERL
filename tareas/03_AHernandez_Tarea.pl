#!perl
use warnings;
use strict;
use HTML::Template;
my $num_args = @ARGV;
if ($num_args != 1) {
 print "Necesita una ruta del archivo psswd como parametro\n";
 exit;
}
open FHTML,">index.html" or die "Error";
print FHTML &showPass($ARGV[0]);
close FHTML;
#`firefox index.html`;

sub obtieneDatos{
  my $filename=$_[0];
  open FILE,"<",$filename;
  my @file=(<FILE>);
  my @user;
  my @pass;
  my @uid;
  my @gid;
  my @desc;
  my @home;
  my @shell;

  for(@file){
    if(/(.*)\:(.*)\:(.*)\:(.*)\:(.*)\:(.*)\:(.*)/){
      push(@user,$1);
      push(@pass,$2);
      push(@uid,$3);
      push(@gid,$4);
      push(@desc,$5);
      push(@home,$6);
      push(@shell,$7);
    }
  }
  my @info=(\@user,\@pass,\@uid,\@gid,\@desc,\@home,\@shell);
  close FILE;
  return \@info;
}

sub showPass{
  my $output; 
  my $template = HTML::Template->new(filename => './template.tmpl');
  my $info=&obtieneDatos($_[0]);
  my @loop_data=();
  while(@{$info->[0]}){
    my %row_data;           
    $row_data{user}=shift @{$info->[0]};
    $row_data{pass}=shift @{$info->[1]};
    $row_data{uid}=shift @{$info->[2]};
    $row_data{gid}=shift @{$info->[3]};
    $row_data{desc}=shift @{$info->[4]};
    $row_data{home}=shift @{$info->[5]};
    $row_data{shell}=shift @{$info->[6]};
    push(@loop_data,\%row_data);
  }           
  $template->param(hash2 => \@loop_data);
  $output.=$template->output();
  return $output;
}
