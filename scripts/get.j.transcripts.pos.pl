#!/usr/bin/perl -w

system "awk \'\$3\~\/transcript\/ \{print\}\' combined11.collapsed.gff \>pacbio.transcripts";

open A,"pacbio.transcripts"||die $!;
$tmp=join'',<A>;
@pb=split(/\n/,$tmp);
close A;

open B,"sorghum.j.transcripts"||die $!;
open O,">sorghum.j.transcripts.pos"||die $!;
while(<B>){
   chomp;
   $len1=length($_);
   foreach $line(@pb){
      @aa=split(/\t/,$line);
      @bb=split(/\"/,$aa[8]);
      $len2=length($bb[3]);
    if(($len1==$len2)&&($_=~/$bb[3]/)){
       print O "$aa[0]\t$aa[3]\t$aa[4]\n";}
    }
}

close B;
close O;
