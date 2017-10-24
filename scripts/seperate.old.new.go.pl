#!/usr/bin/perl -w
##usage: perl seperate.old.new.go.pl uniq.go sorghum.old.genes sorghum.new.genes ;
open A,"$ARGV[0]"||die $!;
$go=join'',<A>;
@GO=split(/\n/,$go);
close A;

open B,"$ARGV[1]"||die $!;
open OLD,">old.gene.GO"||die $!;
while(<B>){
    chomp;
    @aa=split(/\t/,$_);
    $len1=length($aa[0]);
    foreach $line(@GO){
       @bb=split(/\./,$line);
       $len2=length($bb[0]);
     if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
        @old=join(".",$bb[0],$bb[1]);
        print OLD "@old\n";}
     }
  }

close B;
close OLD;

open N,"$ARGV[2]"||die $!;
open NEW,">new.gene.GO"||die $!;
while(<N>){
    chomp;
    @aa=split(/\t/,$_);
    $len1=length($aa[0]);
    foreach $line(@GO){
       @bb=split(/\./,$line);
       $len2=length($bb[0]);
     if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
        @new=join(".",$bb[0],$bb[1]);
        print NEW "@new\n";}
     }
  }

close N;
close NEW;
