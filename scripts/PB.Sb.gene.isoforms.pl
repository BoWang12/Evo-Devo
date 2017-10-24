#!/usr/bin/perl -w

open A,"PBgene.isoforms.sorghum.count"||die $!;
$pbsb=join'',<A>;
@ps=split(/\n/,$pbsb);
close A;

open B,"PB.Sb.gene"||die $!;
open O,">PB.Sb.gene.isoforms"||die $!;
while(<B>){
   chomp;
   @aa=split(/\t/,$_);
   $len1=length($aa[1]);
    foreach $line(@ps){
       @bb=split(/\t/,$line);
       $len2=length($bb[0]);
     if(($len1==$len2)&&($aa[1]=~/$bb[0]/)){
         print O "$aa[0]\t$aa[1]\t$bb[1]\n";}
   }
}

close B;
close O;

