#!/usr/bin/perl -w
##usage: perl old.new.gene.length.pl /sonas-hs/ware/hpc_norepl/data/bwang/B73V4_2016/v4gene.txt;
#usage: perl old.new.gene.length.pl /sonas-hs/ware/hpc_norepl/data/bwang/sorghum/gramene/v1gene.txt;
#
open A,"$ARGV[0]"||die $!;
$zmv4=join'',<A>;
@gene=split(/\n/,$zmv4);
close A;

open B,"sorghum.new.genes"||die $!;
open NEW,">sorghum.new.gene.length"||die $!;
while(<B>){
    chomp;
    @aa=split(/\t/,$_);
    print NEW "$aa[0]\t";
    $len1=length($aa[0]);
    foreach $line(@gene){
        @bb=split(/\"/,$line);
        $len2=length($bb[1]);
     if(($len1==$len2)&&($aa[0]=~/$bb[1]/)){   
        @cc=split(/\t/,$bb[0]);
        $gene_length=$cc[4]-$cc[3];
       print NEW "$gene_length\n";}
   }
}

close B;
close NEW;

open C,"sorghum.old.genes"||die $!;
open OLD,">sorghum.old.gene.length"||die $!;
while(<C>){
    chomp;
    @aaa=split(/\t/,$_);
    print OLD "$aaa[0]\t";
    $len1=length($aaa[0]);
    foreach $line(@gene){
        @bbb=split(/\"/,$line);
        $len2=length($bbb[1]);
     if(($len1==$len2)&&($aaa[0]=~/$bbb[1]/)){   
        @ccc=split(/\t/,$bbb[0]);
        $gene_length=$ccc[4]-$ccc[3];
       print OLD "$gene_length\n";}
   }
}

close C;
close OLD;
