#!/usr/bin/perl -w

system "awk \'\$3\~\/transcript\/ \{print\}\' gffcmp.annotated.gtf \>gffcmp.combined.transcripts";

open A,"gffcmp.combined.transcripts"||die $!;
open O,">PB.Sb.gene.temp"||die $!;

while(<A>){
   if($_=~/gene_name/){
   chomp;
   @aa=split(/\t/,$_);
   @bb=split(/\;/,$aa[8]);
   @cc=split(/\"/,$bb[1]);
   @dd=split(/\"/,$bb[2]);
   print O "$dd[1]\t$cc[1]\n";
}
}

close A;
close O;

system "cat PB.Sb.gene.temp \| sort \| uniq \>PB.Sb.gene";
system "rm -rf PB.Sb.gene.temp";

