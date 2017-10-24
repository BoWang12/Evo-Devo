#!/usr/bin/perl -w
##$ARGV[0]=the m9 file

open R, "$ARGV[0]";
$all=join'',<R>;
close R;

@m9=split/BLASTN/,$all;
splice(@m9,0,1);
foreach (@m9)
{@line=split/\n/,$_;
 foreach $tm (@line)
 {if(!($tm=~/\#/ || $tm=~/\[/))
  {print "$tm\n";
   last;
  }
 }
}

