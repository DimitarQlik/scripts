#!/usr/bin/perl
use strict;
use warnings;

use Tie::File;
use File::Spec;

chomp(my $filename = File::Spec->rel2abs($ARGV[0]));
tie my @array, 'Tie::File', $filename or die $!;

my $count=0;
my $line;
for (my $i = 0; $i < $#array; $i++)
{ 
   $line = $array[$i];
   if ($line =~ /<ProjectConfiguration/ && $line =~ /Sense.*Win32/)
   {     
      ++$count;
      #remove line in place
      splice(@array,$i--,1);      
   }
   elsif ($count > 0 && $line =~ /<\/ProjectConfiguration/)
   { 
      $count = 0;
      #remove line in place
      splice(@array,$i--,1);
   }
   elsif ($count == 0)
   {
   #  $line =~ s/\r//g ;
   #  print $line . "\n";   
   }
   else
   {
     #remove line in place
     splice(@array,$i--,1);
   }
  
}


