#!/usr/bin/perl -w
##usage: perl get.18961left.pl v4gene.isoforms.count 18961left.id 
open A,"$ARGV[0]"||die $!;
$all=join'',<A>;
@al=split(/\n/,$all);
close A;

open B,"$ARGV[1]"||die $!;
while(<B>){  
   chomp;
   $len1=length($_);
   foreach $line(@al){
       @aa=split(/\t/,$line);
       $len2=length($aa[0]);
      if(($len1==$len2)&&($_=~/$aa[0]/)){
    print "$_\t$aa[1]\n";
   }
}
}

close B;


