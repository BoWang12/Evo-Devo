#!/usr/bin/perl -w

system "awk '\$3~\/transcript\/ {print}' combined11.collapsed.gff >all.transcript ";

open A,"all.transcript"||die $!;
open T1,">gene.mrnaid"||die $!;
while(<A>){
    chomp;
    @aa=split(/\t/,$_);
    @bb=split(/\"/,$aa[8]);
    print T1 "$bb[1]\t$bb[3]\n";}

close A;
close T1;

system "awk '{print \$1}' gene.mrnaid | sort | uniq >uniq.geneid ";

open C,"uniq.geneid"||die $!;
open D,"gene.mrnaid"||die $!;
open O,">gene.cluster"||die $!;
$all=join'',<D>;
@original=split(/\n/,$all);

while(<C>){
    chomp;
    print O "$_\t";
    $len1=length($_);
    foreach $line(@original){
         @qq=split(/\t/,$line);
         $len2=length($qq[0]);
      if(($len1==$len2)&&($_=~/$qq[0]/)){
         print O "$qq[1]\,";}
      }
     print O "\n";}

close C;
close D;      
close O;

open E,"gene.cluster"||die $!;
open F,">all.collapsed.gene_cluster.txt"||die $!;
while(<E>){
   chomp;
   chop;
   print F "$_\n";}

close E;
close F;
