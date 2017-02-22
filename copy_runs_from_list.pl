#!/usr/bin/perl -w

use strict;
use warnings;

#use Path::Class;
#use autodie; # die if problem reading or writing a file
 
# (1) quit unless we have the correct number of command-line args
#$num_args = $#ARGV + 1;
#if ($num_args != 1) {
#    print "\nUsage: copy_runs_from_list.pl <list>\n";
#    exit;
#}
 
# (2) we got two command line args, so assume they are the
# first name and last name
my $list=$ARGV[0];

# print "Hello, $first_name $last_name\n";

my $dir = dir("/u/data/comp/lsilva/analise/scripts/DY2015_data"); # /tmp

my $file = $dir->file($list);

# Read in the entire contents of a file
# my $content = $file->slurp();

# openr() returns an IO::File object to read from
my $file_handle = $file->openr();

# Read in line at a time
while( my $line = $file_handle->getline() ) {
        print $line;
}

