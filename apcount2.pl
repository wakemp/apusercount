#!/usr/bin/perl

use strict;
use warnings;
use SNMP::Util;

main(@ARGV);

sub main
{
# my $file = $ARGV[0];
# open (FH, $file);

$host = $ARGV[0];
$community = $ARGV[1];
$users24OID = '1.3.6.1.4.1.9.9.273.1.1.2.1.1.1'
$user50OID = '1.3.6.1.4.1.9.9.273.1.1.2.1.1.2'
$ifNumberOID = '.1.3.6.1.2.1.2.1.0';
$ifTypeOID = '.1.3.6.1.2.1.2.2.1.3';
$ifOperStatusOID = '.1.3.6.1.2.1.2.2.1.8';
$output = "serverlist.txt";

$snmp = new SNMP::Util(-device => $host,
		       -community => $community);


# open (OUTPUT, ">> $output");
       
$users24 = $snmp->get('v',$users24OID);
$users50 = $snmp->get('v',$users50OID);
message (join ("2.4GHz users=",$users24,"5.0GHz Users=",$users50));


# close (OUTPUT);
}

sub message 
{
	my $m = shift or return; 
	print("$m\n");
}