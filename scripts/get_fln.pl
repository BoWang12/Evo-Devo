#!/usr/bin/perl -w
##usage: perl get_fln.pl RS_Sequel_hq.fastq leaf.collapsed.group.txt ;
#
open A,"$ARGV[0]"||die $!;
open B,">reads.FL.length"||die $!;
$i=0;
while(<A>){
   $i++;
   if($i%4==1){
      chomp;
      @aa=split(/\;/,$_);
      @bb=split(/\=/,$aa[1]);
      @cc=split(/\=/,$aa[3]);
      @dd=split(/\s+/,$aa[0]);
     print B "$dd[0]\t$bb[1]\t$cc[1]\n";}
 }

close A;
close B;

open C,"reads.FL.length"||die $!;
open D,"$ARGV[1]"||die $!;
open O,">FL.count.txt"||die $!;
$reads=join'',<C>;
@all=split(/\n/,$reads);
while(<D>){
   chomp;
   @aa=split(/\t/,$_);
   print O "$aa[0]\t";
   #$aa[0]=~s/\|/\:/g;
   #$aa[0]=~s/\//\:/g;
   @bb=split(/\,/,$aa[1]);
   foreach $id(@bb){
       #$id=~s/(\|)||(\/)/\:/g;
        $id=~s/\|/\:/g;
        $id=~s/\//\:/g;
      #print "$id\n";
       $len1=length($id);
       foreach $line(@all){
          @cc=split(/\t/,$line);
          $cc[0]=~s/\@//g;
          #$cc[0]=~s/(\|)||(\/)/\:/g;
          $cc[0]=~s/\|/\:/g;
          $cc[0]=~s/\//\:/g;
         #print "$cc[0]\n";
         $len2=length($cc[0]);
          if(($len1==$len2)&&($id=~/$cc[0]/)){
        print O  "$cc[1]\t";}
      }
 }   
 print O  "\n";
} 

close C;
close D;
close O;

