#!/usr/bin/perl -w

open A,"$ARGV[0]"||die $!;
%fa=<A>;
foreach $id(keys%fa){
     $seq=$fa{$id};
     chomp($seq);
     $len=length($seq);
    print "PacBio\t$len\n";
  }

close A;


