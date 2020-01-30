#!/usr/bin/perl -w
open(WDFILE, `$ENV{WDHOME}/wdscheme.pl`);
while(<WDFILE>) {
		$n = $. - 1;
		if ($n < $ENV{WDSIZE}) {
				print "$n $_";
		}
}
close WDFILE;
