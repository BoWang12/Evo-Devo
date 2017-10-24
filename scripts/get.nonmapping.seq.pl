#!/usr/bin/perl -w

#usage: perl get.nonmapping.seq.pl RS_Sequel_hq.fa combined11.ignored_ids.txt;
#
#
open A,"$ARGV[0]"||die $!;
%all=<A>;
close A;

open B,"$ARGV[1]"||die $!;
open O,">nonmapped.hq.fa"||die $!;
while(<B>){
   chomp;
   @aa=split(/\s+/,$_);
   $aa[0]=~s/\//\:/g;
   $aa[0]=~s/\|/\:/g;
   $len1=length($aa[0]);
   foreach $id(keys%all){
       $seq=$all{$id};
       chomp($id);
       @bb=split(/\s+/,$id);
       $bb[0]=~s/\//\:/g;
       $bb[0]=~s/\|/\:/g;
       $bb[0]=~s/>//g;
       $len2=length($bb[0]);
    if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
       print O "$id\n$seq";}
   }
}

close A;

close B;

close O;
