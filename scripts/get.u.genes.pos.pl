#!/usr/bin/perl -w

system "awk \'\$3~\/transcript\/ \{print\}\' gffcmp.annotated.gtf \>transcripts.gtf" ;

open A,"transcripts.gtf"||die $!;
open B,"sorghum.u.genes"||die $!;
$gtf=join'',<A>;
@transcripts=split(/\n/,$gtf);
close A;

open O,">sorghum.u.genes.gtf"||die $!;
while(<B>){
   chomp;
   $len1=length($_);
    foreach $line(@transcripts){
        @aa=split(/\"/,$line);
        $len2=length($aa[3]);
     if(($len1==$len2)&&($_=~/$aa[3]/)){
        $new=join("\"",@aa);
        print O "$new\n";
      last;}      
   }
}

close B;
close O;



