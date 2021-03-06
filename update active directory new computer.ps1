#import active directory module, clear screen, set continue var
Import-Module ActiveDirectory
cls
$cntu = "y"
echo "SEE: updateNewComputer_README.txt for more.
This script will take a computer name and complete the following:

I.   Add a new description from user input
II.  Add the computer to the Adobe Reader, MS Office, App-V groups in AD
III. Move the computer to the Unassigned OU.
IV.  TODO: Automatically add WiFi password to the wireless interface.
 
You will then be prompted to continue to set another.
 "
while ($cntu -eq "y")
{
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
     Add-ADGroupMember "CON-Microsoft Office 2016 Professional Plus" -members $cmpnm1
     Add-ADGroupMember "gpo-app-v 4.6" -members $cmpnm1

    #move computer to new OU
    Get-ADComputer $cmpnm | Move-ADObject -TargetPath 'ou=Unassigned, ou=MMFS, dc=macmiller, dc=local'
    
    #script complete, echo new details and remind user to GPUPDATE on the client"
    echo "Finished, new computer details:"
    Get-ADComputer $cmpnm
    echo ""
    echo "Execute gpupdate on client for immediate changes to take affect..."
    echo ""
    
    #check for another computer to change
    $cntu = Read-Host "Modify another(y/n)"
    cls
}
