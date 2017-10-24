#!/usr/bin/perl -w

system "awk '\$3\~\/transcript\/ \{print\}\' combined11.collapsed.gff \>PB.transcripts";

open A,"PB.transcripts"||die $!;
open T,">temp"||die $!;

while(<A>){
   chomp;
   @aa=split(/\t/,$_);
   @bb=split(/\"/,$aa[8]);
   print T "$bb[1]\t$bb[3]\n";}

close A;
close T;

system "awk \'\{print \$1\}\' temp \| sort \| uniq \>PB.id";

open C,"PB.id"||die $!;
open D,"temp"||die $!;
open O,">PBgene.isoforms.count"||die $!;

$all=join'',<D>;
@al=split(/\n/,$all);
while(<C>){
    chomp;
    #print "$_\t";
    push(@new,$_);
    $len1=length($_);
    foreach $line(@al){
         @aa=split(/\t/,$line);
         $len2=length($aa[0]);
       if(($len1==$len2)&&($aa[0]=~/$_/)){
     push (@new,$aa[1]);}
     }
     #print "@new\n";
    $count=scalar(@new)-1;
    print O "$new[0]\t$count\n";
    #$count=scalar(@new)-1;
     @new='';
     shift(@new);
  }# print "$new[0]\t$count\n";}
close C;
close D;
close O;




