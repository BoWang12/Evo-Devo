#!/usr/bin/perl -w
##usage: perl final.zmv4gene.isoform.pl v4gene.isoforms.count zmv4.gene.know.new.from.tracking;

open A,"$ARGV[0]"||die $!;
open B,"$ARGV[1]"||die $!;
$v4=join'',<A>;
@zmv4=split(/\n/,$v4);
$known='';
$new='';
$all='';
open O,">sbpacgene.known.new.summary"||die $!;
print O "gene\tknown\tnew\tsummary\n";
while(<B>){
   chomp;
   @aa=split(/\t/,$_);
  #print "$aa[2]\n";
   $len1=length($aa[0]);
   foreach $line(@zmv4){
      @bb=split(/\t/,$line);
     #print "$bb[1]\n";
      $len2=length($bb[0]);
     if(($len1==$len2)&&($aa[0]=~/$bb[0]/)){
        $known=$bb[1];
        $new=$aa[2];
        $all=$known+$new;
     print O "$aa[0]\t$known\t$new\t$all\n";}
 
     }
    
  #print "$new\n";}
   } #print "$new\n";}
   #print "$_\t$known\t$new\t$all\n";}

close A;
close B;
close O;
