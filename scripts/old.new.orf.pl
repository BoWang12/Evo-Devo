#!/usr/bin/perl -w
#usage: perl old.new.orf.pl /sonas-hs/ware/hpc_norepl/data/bwang/B73V4_2016/cyverse/cds.fa;
#usage: perl old.new.orf.pl /sonas-hs/ware/hpc_norepl/data/bwang/sorghum/gramene/cds.fa;
#
open A,"$ARGV[0]"||die $!;
%cds=<A>;
close A;

open B,"sorghum.new.genes"||die $!;
open NEW,">sorghum.new.orf.length"||die $!;
while(<B>){
   chomp;
   @aa=split(/\t/,$_);
   $len1=length($aa[0]);
    foreach $id(keys%cds){
       $seq=$cds{$id};
       chomp($seq);
       $orf_length=length($seq);
       @bb=split(/\./,$id);
       $bb[0]=~s/>//g;
       $len2=length($bb[0]);
    if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
        print NEW "$orf_length\n";}
    }
}

close B;
close NEW;

open C,"sorghum.old.genes"||die $!;
open OLD,">sorghum.old.orf.length"||die $!;
while(<C>){
   chomp;
   @aaa=split(/\t/,$_);
   $len1=length($aaa[0]);
    foreach $id(keys%cds){
       $seq=$cds{$id};
       chomp($seq);
       $orf_length=length($seq);
       @bbb=split(/\./,$id);
       $bbb[0]=~s/>//g;
       $len2=length($bbb[0]);
    if(($len1==$len2)&&($aaa[0]=~/$bbb[0]/)){
        print OLD "$orf_length\n";}
    }
}

close B;
close OLD;


