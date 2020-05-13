#################Requiered Inputs#############
$SeasonOfSeries = "S03"
$path = "D:\3_Unterhaltung\03_Serien\13 Reasons why\Season3"
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