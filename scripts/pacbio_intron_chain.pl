#!/usr/bin/perl -w

### This script is used to get intron chain of each transcript from PacBio data, to see is tehre any annotated transcripts in maizev3 located in the region of long-read data, so that we might can get rid of these 'not-real' genes;

##usage: perl pacbio_intron_chain.pl all.collapsed.gff >pacbio_intron_chain_each_transcript;

open A,"$ARGV[0]" || die $!;

$first=0;
while(<A>){
  if($_=~/\ttranscript\t/){
    $first++;
    @sp=split(/\t/,$_);
    @sec=split(/\;/,$sp[8]);
    @thd=split(/\"/,$sec[1]);
  if($first==1){
    print "chr1\tPB.1.1\t";}    
  if($first!=1){
     print_intron(@exons);
     @exons=();
     print "$sp[0]\t$thd[1]\t";
     }
  }
  elsif($_=~/\texon\t/){
    @eachline=split(/\t/,$_);
    push(@exons,$eachline[3],$eachline[4]);
    }
}

sub print_intron {
    my(@exons)=@_;
    if(scalar(@exons)>2){
     my @ordered_exons=sort {$a<=>$b} @exons;
     for(my $i=1;$i<=scalar(@ordered_exons)-3; $i=$i+2){
     my $fst_intron_start=$ordered_exons[$i]+1;
     my $fst_intron_stop=$ordered_exons[$i+1]-1;
     print "$fst_intron_start\t$fst_intron_stop\t";}
 }
   else {print "This transcript has only one exon!";}
   
 print "\n";}

close A;

