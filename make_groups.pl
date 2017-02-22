#!/usr/bin/perl

sub print_help{
  print "Usage:\n";
  print "groups.pl <config_dir>\n";
  print "where <config_dir> = directory containing the grouping files\n";
  exit(0);
}

$indir = "$ARGV[0]"; 
$outdir = "$ARGV[0]/new"; 
if ($#ARGV != 0){
  print_help();
}
else{
  if(! -d $indir){
    print "directory $indir does not exist\n";
    exit(0);
  }
}

if(-d $outdir){
  #print "directory $outdir exists. It will be removed\n";
  `rm -rf $outdir`;
}

chdir $indir;
@files = `ls -1 $indir`;
mkdir $outdir;

foreach $infile (@files){
  chop($infile);
  if(!($infile =~ /.config$/)){
    next;
  }
  if(! -f $infile){
    print "file $infile does not exist\n";
    exit(0);
  }
  $outfile="$infile.out";

  @lines=`cat $infile`;
  open(OUT,">$outfile");
  foreach $line (@lines){
    $newline="$line";
    if($line =~ m/\d{5}\s+\|(\s+\S+\s+)(\|\s+\S+\s+\|)/){
      @var=split('\|\s+\S+\s+\|\s+\S+\s+\|',$line);
      $newline="$var[0]$2$1|$var[1]";
    }
    print OUT "$newline";
  }
  close (OUT);
  `mv $outfile $outdir/$infile`
}

