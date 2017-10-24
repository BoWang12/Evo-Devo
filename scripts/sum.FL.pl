#!/usr/bin/perl -w
##usage: perl sum.FL.pl FL.count.txt;
#
open A,"$ARGV[0]"||die $!;
open O,">FL.count.sum.txt"||die $!;
while(<A>){
    chomp;
    @aa=split(/\t/,$_);
    print O "$aa[0]\t";
    shift(@aa);
    #$start=$aa[0];
    $sum=0;
     foreach $num(@aa){
        $sum=$num+$sum;
      }
    print O "$sum\n";}

close A;
close O;

