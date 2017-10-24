#!/usr/bin/perl -w
##usage: perl final.FL.count.pl gffcmp.tracking ;
#
open A,"$ARGV[0]"||die $!;
$tracking=join'',<A>;
@cmp_tracking=split(/\n/,$tracking);
close A;

open B,"FL.count.sum.txt"||die $!;
open C,">without.length.txt"||die $!;
while(<B>){
    chomp;
    @aa=split(/\t/,$_);
    $len1=length($aa[0]);
   #print "$aa[0]\t$len1\n";
    # print "$len1\n";
      foreach $line(@cmp_tracking){
        @bb=split(/\t/,$line);
        @cc=split(/\|/,$bb[4]);
        @ee=split(/\:/,$cc[0]);
        $len2=length($cc[1]);
      #print "$cc[1]\t$len2\n";
      if((($bb[3]=~/j/)||($bb[3]=~/u/))&&($len1==$len2)&&($aa[0]=~/$cc[1]/)){
        print C "$aa[0]\t$ee[1]\t$aa[1]\tNA\tNA\n";}
      elsif(($len1==$len2)&&($aa[0]=~/$cc[1]/)&&($bb[3]=~/\=/)){
        @dd=split(/\|/,$bb[2]);
        #@ff=split(/\:/,$dd[0]);
        #@gg=split(/\:/,$dd[1]);
      print C "$aa[0]\t$ee[1]\t$aa[1]\t$dd[0]\t$dd[1]\n";}
     }
}

close B;
close C;

#open D,"leaf.collapsed.rep.fq"||die $!;
open D,"combined11.collapsed.rep.fq"||die $!;
open E,">header"||die $!;
$i=0;
while(<D>){
    $i++;
    if($i%4==1){
      print E "$_" ;}
}
close D;
close E;

open F,"without.length.txt"||die $!;
open G,"header"||die $!;
open O,">all.combined_for_rarefaction.novel_n_known.txt"||die $!;
$header=join'',<G>;
@header_length=split(/\n/,$header);
while(<F>){
   chomp;
   @aa=split(/\t/,$_);
   $len1=length($aa[0]);
    foreach $line(@header_length){
       @bb=split(/\|/,$line);
       $bb[0]=~s/\@//g;
       @cc=split(/\//,$bb[3]);
       $len2=length($bb[0]);
     if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
         print O "$aa[0]\t$aa[1]\t$aa[2]\t$cc[2]\t$aa[3]\t$aa[4]\n";}
   }
}

close F;
close G;
close O;
   
