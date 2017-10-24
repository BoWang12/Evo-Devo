#!/usr/bin/perl -w

open A,"gffcmp.tracking"||die $!;
open B,">gffcmp.tracking.temp"||die $!;
while(<A>){
    chomp;
    @aa=split(/\t/,$_);
    if(($aa[2]=~/^Sb/)&&(($aa[3]=~/\=/)||($aa[3]=~/j/))){
         @bb=split(/\|/,$aa[2]);
         #@cc=split(/\:/,$bb[0]);
         print B "$bb[0]\t$aa[3]\n";}
  }

close A;
close B;

system "awk \'\{print \$1\}\' gffcmp.tracking.temp \| sort \| uniq \>Sbid.from.tracking";

open C,"Sbid.from.tracking"||die $!;
open D,"gffcmp.tracking.temp"||die $!;
$all=join'',<D>;
@al=split(/\n/,$all);

open O,">Sb.gene.know.new.from.tracking"||die $!;
while(<C>){
    chomp;
    $len1=length($_);
    $know=0;
    $new=0;
    foreach $line(@al){
        @aa=split(/\t/,$line);
        $len2=length($aa[0]);
     if(($len1==$len2)&&($_=~/$aa[0]/)&&($aa[1]=~/\=/)){
          $know++;
        }
     elsif(($len1==$len2)&&($_=~/$aa[0]/)&&($aa[1]=~/j/)){
          $new++;
        }
  }
  print O "$_\t$know\t$new\n";
}

close C;
close D;
close O;

