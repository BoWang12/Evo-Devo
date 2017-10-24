#!/usr/bin/perl -w
##usage: perl singleton.expression.pl /sonas-hs/ware/hpc_norepl/data/bwang/comparative/analysis/new.analysis/maizev4.fpkm maize.new.genes maize.old.genes;
#
open A,"$ARGV[0]"||die $!;
$tmp=join'',<A>;
@expression=split(/\n/,$tmp);
close A;

open B,"$ARGV[1]"||die $!;
open S,">sorghum.newgenes.fpkm"||die $!;
while(<B>){
   chomp;
   #$len1=length($_);
   @tt=split(/\t/,$_);
   $len1=length($tt[0]);
   foreach $line(@expression){
      @aa=split(/\t/,$line);
      $len2=length($aa[0]);
    if(($len1==$len2)&&($tt[0]=~/$aa[0]/)){
   $fpkm=join("\t",@aa);
     print S "$fpkm\n";}
   }
}

close B;
close S;

open C,"$ARGV[2]"||die $!;
open D,">sorghum.oldgenes.fpkm"||die $!;
while(<C>){
   chomp;
   @tt=split(/\t/,$_);
   $len1=length($tt[0]);
   foreach $line(@expression){
      @aa=split(/\t/,$line);
      $len2=length($aa[0]);
    if(($len1==$len2)&&($tt[0]=~/$aa[0]/)){
   $fpkm=join("\t",@aa);
     print D "$fpkm\n";}
   }
}

close C;
close D;

