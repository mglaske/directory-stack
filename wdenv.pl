#!/usr/bin/perl -w
open(WDFILE, `$ENV{WDHOME}/wdscheme.pl`);
while(<WDFILE>) {
		chomp;
		if ($_ && $. <= $ENV{WDSIZE}) {
#				s/(\s)/\\$1/g; 	#escape whitespace
				print "export WD".($.-1)."='$_'\n";
		}
}
close WDFILE;
