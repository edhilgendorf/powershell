Update New Computer (Active Directory)

This script will do three things: 

I.   Add a computer description in Active Directory (Generally computer model)
II.  Add the computer to three Active Directory groups: gpo-appv, gpo-adobe reader, con-microsoft-office
III. Move the computer to the Unassigned Organizational Unit


To Run: 

This script utilizes the Active Directory Module for Powershell, and thus cannot be launched from 
normal command line, or powershell. 

To utilize this Module, click start and type"Powershell" and right click "Active Directory Module 
for Windows PowerShell" and run as depadmin

Navigate to script location:
EX: "c:\myname\scripts\"

Execute script:
EX: ".\update active directory new computer.ps1"

It will prompt for computer name, then enter the description. It will output the new details of
the computer once finished.