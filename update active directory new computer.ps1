#import active directory module
Import-Module ActiveDirectory

#get computername from user
$cmpnm = Read-Host "Enter computer name"
$cmpnm1 = $cmpnm + "$"
echo $cmpnm

#get computer description from user
$descIn = Read-Host "Enter computer model for description"
$desc = "Unassigned("+$descIn+")"
echo $desc

#set computer description
Set-ADComputer $cmpnm1 -Description $desc

#add computer to groups
 Add-ADGroupMember "gpo-adobe reader" -members $cmpnm1
 Add-ADGroupMember "con-microsoft office 2010 professional plus" -members $cmpnm1
 Add-ADGroupMember "gpo-app-v 4.6" -members $cmpnm1

#move computer to new OU
Get-ADComputer $cmpnm | Move-ADObject -TargetPath 'ou=Unassigned, ou=MMFS, dc=macmiller, dc=local'

echo "Finished, new computer details:"
Get-ADComputer $cmpnm
