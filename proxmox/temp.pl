        @files_source_dir = </mnt/pve/USB_Festplatte/Daily_Backup/dump/*>;
        @files_dest_dir = </mnt/pve/FreeNAS/dump/*>;
        foreach my $file_in_source_dir (@files_source_dir) {
          #print $file_in_source_dir . "\n";
          $file_in_source_dir = (split '/', $file_in_source_dir)[-1];
          foreach my $file_in_dest_dir (@files_dest_dir) {
            #print $file_in_dest_dir . "\n";
            $file_in_dest_dir = (split '/',$file_in_dest_dir)[-1];
            if ($file_in_dest_dir eq $file_in_source_dir) {
              print 'same Files';
            }else {
                print "Diese Dateien sind im nas mehr: " . $file_in_dest_dir;
            }
          }
        }
