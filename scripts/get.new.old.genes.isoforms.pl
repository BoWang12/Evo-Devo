#!/usr/bin/perl -w
#
open A,"PB.Sb.gene.isoforms.replaced.name"||die $!;
$all=join'',<A>;
@al=split(/\n/,$all);
close A;

open B,"sorghum.new.genes"||die $!;
open BB,">sorghum.new.genes.isoforms"||die $!;
while(<B>){
    chomp;
    @aa=split(/\t/,$_);
    $len1=length($aa[0]);
      foreach $line(@al){
            @bb=split(/\t/,$line);
            $len2=length($bb[0]);
        if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
            print BB "$aa[0]\t$bb[2]\n";}
     }
}

close B;
close BB;

open C,"sorghum.old.genes"||die $!;
open CC,">sorghum.old.genes.isoforms"||die $!;
while(<C>){
     chomp;
    @aa=split(/\t/,$_);
    $len1=length($aa[0]);
      foreach $line(@al){
            @bb=split(/\t/,$line);
            $len2=length($bb[0]);
        if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
            print CC "$aa[0]\t$bb[2]\n";}
     }
}

close C;
close CC;
