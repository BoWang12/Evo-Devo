#!/usr/bin/perl -w
#usage: perl decile.pl sorted.kaks.fpkm;
open A,"$ARGV[0]"||die $!;
$line=0;
while(<A>){   
chomp;
$line=$line+1;
   @aa=split(/\t/,$_); 
  if($line<=5438){
   $aa[0]=1;
   $new=join("\t",@aa);
   print "$new\n";}
  elsif(($line>5438)&&($line<=10876)){
    $aa[0]=2;
    $new=join("\t",@aa);
   print "$new\n";}
  elsif(($line>10876)&&($line<=16314)){
    $aa[0]=3;
    $new=join("\t",@aa);
   print "$new\n";}
  elsif(($line>16314)&&($line<=21752)){
    $aa[0]=4;
    $new=join("\t",@aa);
   print "$new\n";}
elsif(($line>21752)&&($line<=27190)){
    $aa[0]=5;
    $new=join("\t",@aa);
   print "$new\n";}
elsif(($line>27190)&&($line<=32628)){
    $aa[0]=6;
    $new=join("\t",@aa);
   print "$new\n";}
elsif(($line>32628)&&($line<=38066)){
    $aa[0]=7;
    $new=join("\t",@aa);
   print "$new\n";}
elsif(($line>38066)&&($line<=43504)){
    $aa[0]=8;
    $new=join("\t",@aa);
   print "$new\n";}
elsif(($line>43504)&&($line<=48942)){
    $aa[0]=9;
    $new=join("\t",@aa);
   print "$new\n";}
elsif($line>48942){
    $aa[0]=10;
    $new=join("\t",@aa);
   print "$new\n";}
}
   
