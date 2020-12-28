#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my ($orf_file, $exon_chain_file) = @ARGV;

my %orf;
open(my $orf_fh, "<", $orf_file);
while (<$orf_fh>) {
  chomp;
  my ($id,$start,$end,$flip) = $_ =~ m/>(PB\.\d+\.\d+)_\d+\s\[(\d+)\s-\s(\d+)\]\s*(.*)/;
  $orf{$id} = {start => $start, end=> $end, strand => $flip ? "-" : "+"};
}
close $orf_fh;

open (my $exon_fh, "<", $exon_chain_file);
while (<$exon_fh>) {
  chomp;
  my ($chr,$id,@exon_junctions) = split;
  if ($orf{$id}) {
    my $distance = 0;
    if ($orf{$id}{strand} eq '+') {
      my $last_exon_junction_pos = 0;
      for(my $i=1;$i<@exon_junctions-1;$i+=2) {
        $last_exon_junction_pos += $exon_junctions[$i] - $exon_junctions[$i-1] + 1;
      }
      $distance = $last_exon_junction_pos - $orf{$id}{end};
    }
    else {
      my $last_exon_junction_pos = 0;
      my $transcript_length = $exon_junctions[1] - $exon_junctions[0];
      for(my $i=@exon_junctions-1;$i>1;$i-=2) {
        $last_exon_junction_pos += $exon_junctions[$i] - $exon_junctions[$i-1] + 1;
      }
      $transcript_length += $last_exon_junction_pos;
      $distance = $last_exon_junction_pos - ($transcript_length - $orf{$id}{end});
    }
    print join("\t",$chr,$id,$distance),"\n";
  }
}