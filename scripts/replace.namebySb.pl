#!/usr/bin/perl -w

open A,"PB.Sb.gene.isoforms"||die $!;

system "awk \'\$3\~\/gene\/ \{print\}\' \/sonas-hs\/ware\/hpc_norepl\/data\/bwang\/sorghum\/gramene\/sorghumv1.gtf \>gene.line";

open B,"gene.line"||die $!;
$allgene=join'',<B>;
@gene=split(/\n/,$allgene);
close B;

open O,">PB.Sb.gene.isoforms.replaced.name"||die $!;

while(<A>){
   if($_!~/^(Sb)/){
      chomp;
      @aa=split(/\t/,$_);
      $len1=length($aa[0]);
     foreach $line(@gene){
         @bb=split(/\t/,$line);
         @cc=split(/\"/,$bb[8]);
        $len2=length($cc[3]);
       if(($len1==$len2)&&($aa[0]=~/$cc[3]/)){
           print O "$cc[1]\t$aa[1]\t$aa[2]\n";}
       }
    }
    else {print O "$_";}

 }

close A;
close O;

