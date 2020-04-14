#################Requiered Inputs#############
$NameOfSeries = "Game of Thrones"
$SeasonOfSeries = "01"
$path = "D:\3_Unterhaltung\03_Serien\Game of Thrones\S1"
##############################################


$fileCounter = 01
$files = Get-ChildItem -File $path
Write-Host

foreach ($file in $files) {
   $file | Rename-Item -NewName {$NameOfSeries + "_S$SeasonOfSeries" + "EP$fileCounter" + $file.Extension}
   $fileCounter++
}