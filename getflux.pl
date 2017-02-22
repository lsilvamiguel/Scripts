#!/usr/local/bin/perl

@files=`ls -1 I*`;

foreach $f (@files){

    open(FILE,$f);
 
    @lines=<FILE>;


    foreach $l (@lines){

	if($l =~ m/\#\s\s\d.*root$/) { 
#	    print "$l";	

	    $run=substr($l,-15,5);
	
	    push(@altogether,$run);
	    push(@runs,$run);

	}
	if($l =~ /method \#1/){

	    $_ = $l;

	    if(/\):\s(.*)$/){
#		print "$1\n";
		
		push(@altogether,$1);    
		push(@fluxes,$1);
	    }
	}
    }
}

if($#runs ne $#fluxes){
    
    die "Numbers of runs and fluxes are different ... quiting\n";
}

#foreach i

$format1 ="%g\t%g\n" x (@altogether / 2);
printf $format1, @altogether;
# $format2 ="%g\n" x @fluxes;
# printf $format2, @fluxes;

$flux_sum=0;
foreach $f (@fluxes){
    $flux_sum+=$f;
}

print "\t$flux_sum\n";


#print "number of runs is  $#runs\n";
#print "number of fluxes is  $#fluxes\n";
