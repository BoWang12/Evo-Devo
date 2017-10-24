#!/usr/bin/perl -w
##usage: perl get.old.new.genes.isoforms.count.pl Sb.genes.isoforms.all.new sorghum.old.genes sorghum.new.genes; 
#
open A,"$ARGV[0]"||die $!;
$all=join'',<A>;
@al=split(/\n/,$all);
close A;

open B,"$ARGV[1]"||die $!;
open C,">sorghum.old.genes.isoforms.count"||die $!;
while(<B>){
    chomp;
    @bb=split(/\t/,$_);
    $len1=length($bb[0]);
    foreach $line(@al){
   @aa=split(/\t/,$line);
    $len2=length($aa[0]);
   if(($len1==$len2)&&($bb[0]=~/$aa[0]/)){
      print C "$bb[0]\t$aa[1]\n";}
   }
}

close B;
close C;

open D,"$ARGV[2]"||die $!;
open E,">sorghum.new.genes.isoforms.count"||die $!;
while(<D>){
    chomp;
    @bb=split(/\t/,$_);
    $len1=length($bb[0]);
    foreach $line(@al){
   @aa=split(/\t/,$line);
    $len2=length($aa[0]);
   if(($len1==$len2)&&($bb[0]=~/$aa[0]/)){
      print E "$bb[0]\t$aa[1]\n";}
   }
}

close D;
close E;

