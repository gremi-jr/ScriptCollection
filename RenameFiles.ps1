#################Requiered Inputs#############
$SeasonOfSeries = "S01"
$path = "D:\3_Unterhaltung\03_Serien\One Punch Man\season 1"
##############################################


$fileCounter = 01
$files = Get-ChildItem -File $path


foreach ($file in $files) {

   $counter = "{0:D2}" -f $fileCounter
   $newName = $SeasonOfSeries + "EP$counter" + $file.Extension 
   Write-Host "Old: " + $file + " New: " + $newName
   $check = Read-Host
   if($check -match "break"){
      exit
   }else{
      $file | Rename-Item -NewName {$SeasonOfSeries + "EP$counter" + $file.Extension}
   }
  
   
   $fileCounter++
}