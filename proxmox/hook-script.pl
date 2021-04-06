#!/usr/bin/perl -w

# example hook script for vzdump (--script option)

use strict;
use File::Copy;

print "HOOK: " . join (' ', @ARGV) . "\n";

my $phase = shift;

if ($phase eq 'job-start' || 
    $phase eq 'job-end'  || 
    $phase eq 'job-abort') { 

    my $dumpdir = $ENV{DUMPDIR};

    my $storeid = $ENV{STOREID};

    #print "HOOK-ENV: dumpdir=$dumpdir;storeid=$storeid\n";

    # do what you want 

} elsif ($phase eq 'backup-start' || 
	 $phase eq 'backup-end' ||
	 $phase eq 'backup-abort' || 
	 $phase eq 'log-end' || 
	 $phase eq 'pre-stop' ||
	 $phase eq 'pre-restart') {

    my $mode = shift; # stop/suspend/snapshot

    my $vmid = shift;

    my $vmtype = $ENV{VMTYPE}; # openvz/qemu

    my $dumpdir = $ENV{DUMPDIR};

    my $storeid = $ENV{STOREID};

    my $hostname = $ENV{HOSTNAME};

    # tarfile is only available in phase 'backup-end'
    my $tarfile = $ENV{TARFILE};

    # logfile is only available in phase 'log-end'
    my $logfile = $ENV{LOGFILE}; 

    #print "HOOK-ENV: vmtype=$vmtype;dumpdir=$dumpdir;storeid=$storeid;hostname=$hostname;tarfile=$tarfile;logfile=$logfile\n";

    # example: copy resulting backup file to another host using scp
    if ($phase eq 'backup-end') {
    	#system ("scp $tarfile backup-host:/backup-dir") == 0 ||
    	#    die "copy tar file to backup-host failed";
       
        #1. Verschlüssel neues Backup
	print "---Start encryption---" . "\n";
        `gpg -r timogremler -e $tarfile`;
	print "---Encryption finished---" . "\n";
        #2. move verschlüseltes backup
	# $tarfile enthält den ganzen Pfad
        my $source_file = $tarfile . ".gpg";
	my $dest_file = $tarfile . ".gpg";
	$dest_file = (split '/',$dest_file)[-1]; #Holen des Dateinamen 
	$dest_file = "/mnt/pve/KEKW/dump/" . $dest_file; #Schreiben des ganzen Pfades in Variable
	print "$source_file" . "\n";
	print "$dest_file" . "\n";
        print "---Move file---" . "\n";
	move($source_file, $dest_file) or die "The move operation failed: $!";
        print "---Move ended---" . "\n";
	#3. Vergleiche beide verzeichnisse
        my @files_source_dir = </mnt/pve/USB_Festplatte/Daily_Backup/dump/*>;
	my @files_dest_dir = </mnt/pve/KEKW/dump/*>;
        foreach my $file_in_source_dir (@files_source_dir) {
          #print $file_in_source_dir . "\n";
          $file_in_source_dir = (split '/', $file_in_source_dir)[-1] . ".gpg";
          foreach my $file_in_dest_dir (@files_dest_dir) {
            #print $file_in_dest_dir . "\n";
            $file_in_dest_dir = (split '/',$file_in_dest_dir)[-1];
            if ($file_in_dest_dir eq $file_in_source_dir) {
              print 'same Files';
            }else {
	    	print "Diese Dateien sind im nas mehr: " . $file_in_dest_dir;
		#unlink $file_in_dest_dir
	    }
          }
        }
 
        #4. Löschen von überflüssigen backups im NAS
 
    }

    # example: copy resulting log file to another host using scp
    if ($phase eq 'log-end') {
    	#system ("scp $logfile backup-host:/backup-dir") == 0 ||
    	#    die "copy log file to backup-host failed";
    }
    
} else {

    die "got unknown phase '$phase'";

}

exit (0);

