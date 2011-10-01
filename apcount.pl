#!/usr/bin/perl

use strict;
use warnings;
use SNMP;
use Data::Dumper;

main(@ARGV);

sub main
{
my $file = '';
my $OID = 'enterprises.9.9.273';
my $OID24 = '.1.3.6.1.4.1.9.9.273.1.1.2.1.1.1';
my $OID50 = '.1.3.6.1.4.1.9.9.273.1.1.2.1.1.2';
my $host = $ARGV[0];
my $community = $ARGV[1];
my $sess = new SNMP::Session(DestHost => $host, Community => $community);
# my $val = $sess->get($OID);
# message ($val);
# my $vars = new SNMP::VarList([sysDescr,0], [sysContact,0], [sysLocation,0]);
# my @vals = $sess->get($OID);
my $vb = new SNMP::Varbind();
#  do {
#    $val = $sess->getnext($vb);
#   print "@{$vb}\n";
# } until ($sess->{ErrorNum});

# $SNMP::save_descriptions = 1;
# SNMP::initMib(); # assuming mib is not already loaded
# print "$SNMP::MIB{sysDescr}{description}\n";
# message (Dumper($sess->get($OID24))); 
my $user24 = ($sess->get($OID24));
my $user50 = ($sess->get($OID50));
message ("AP Name: $host; 5.0 GHz users: $user50 2.4 GHz Users: $user24");
}




sub message 
{
	my $m = shift or return; 
	print("$m\n");
}
