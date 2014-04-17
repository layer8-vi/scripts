#!/usr/bin/perl

my %pcap;

$directory = '/Users/stanford/mcb_pcap/';

open (FH,'/Users/stanford/mlogs/pcap_red.txt');

while (<FH>) {
	#  print $_;
	$f1=$_;
	chomp $f1;
	@fn=split('.pcap',$f1);
	$f=$fn[0];
	$pcap{$f}=1010;
#	print "$fn[0]  ----- $pcap{$f} \n";
}
close FH;


opendir (DIR, $directory) or die $!;

while (my $file = readdir(DIR)) {
	$f1=$file;
	@fn=split('.pcap',$f1);
	$f=$fn[0];
#	print "pcap $f hash = $pcap{$f} \n";
	next if ($file =~ m/^\./);
	next if $pcap{$f} == 1010;
	
	  my @values = split('_', $file);

	$tme=substr($values[3],0,-5);

       print "$tme\n";
	$yr=substr($tme,0,4);
	$mn=substr($tme,4,2);
	$dy=substr($tme,6,2);
	$hr=substr($tme,8,2);
	$mi=substr($tme,10,2);
	$sec=substr($tme,12,2);


#       print "Year = $yr\n";
#       print "Month = $mn\n";
#       print "Day = $dy\n";
#       print "Hour = $hr\n";
#       print "Minute = $mi\n";
#       print "Second = $sec\n";
	$rn="sudo /usr/local/bin/tshark -r $directory$file -q -z conv,tcp >> /Users/stanford/mlogs/tlog.temp " ;
#	print "$rn\n";
	$rn1="echo $file >> /Users/stanford/mlogs/pcap_red.txt";
#	print "$rn1 \n";
	system ($rn1);


#	system ($rn);
    }
closedir(DIR);


