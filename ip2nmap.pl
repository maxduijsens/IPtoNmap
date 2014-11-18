####################################
# Convert IP range list to nmap
# v0.1
###################################
use strict;
use warnings;
use Net::CIDR;

if ( !$ARGV[0] ) {
	print "Convert DFind to Nmap batch files\n";
	print "Use: $0 input.txt output.sh\n";
	print "input.bat should have the layout:\n";
	print "<prefix> 123.123.123.0 123.123.123.255 <anything>\n";
	exit;
}

my $input = $ARGV[0];
my $output = $ARGV[1];
my $i = 0;

print "Using input: $input\nUsing output: $output\n";

open (IN, "<" . $input);
open (OUT, ">" . $output);
print OUT "# Use command: nmap -n -oG output.txt --open -p 4848 -iL $input\n";
while (<IN>) {
	my @line = split(/\s/, $_);
	#$line[1] = start, $line[2] = end
	my @startip = split(/\./, $line[1]); # TODO: Change to find IP's based on the structure instead of just splitting
	my @endip = split(/\./, $line[2]);
	#my $ip = new Net::IP ($line[1] . ' - ' . $line[2]) || die "error";

	#do {
#		print OUT $ip->ip(), "\n";
#	} while (++$ip);

	    my @tmp = Net::CIDR::range2cidr("$line[1]-$line[2]");
	foreach (@tmp) {
		print OUT "$_\n";
	}

}
close IN;
close OUT;
