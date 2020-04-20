#################Requiered Inputs#############
$NameOfSeries = "AkameGaKill"
$SeasonOfSeries = "01"
$path = "D:\3_Unterhaltung\03_Serien\Akame Ga Kill\"
##############################################


$fileCounter = 01
$files = Get-ChildItem -File $path


foreach ($file in $files) {

   $counter = "{0:D2}" -f $fileCounter

   #Write-Host $counter
   $file | Rename-Item -NewName {$NameOfSeries + "-S$SeasonOfSeries" + "EP$counter" + $file.Extension}
   #Write-Host $NameOfSeries"-S$SeasonOfSeries" "EP$counter" $file.Extension 
   $fileCounter++
}