To Run: 

This script accesses Active Directory to make changes, and MUST be run by an account
with appropriate AD access (depadmin). To do this:

Click start, enter "Powershell", shift-rightclick and run as the proper user account.

Navigate to script location:
EX: "c:\USER$\scripts\"

Execute script:
EX: ".\update active directory new computer.ps1"



You will get a prompt for the computer name, then the description. It will output the new details of
the computer once finished.

After this, enter 'y' to do another, or n to stop.

Update New Computer (Active Directory)

This script will do three things: 

I.   Add a computer description in Active Directory (Generally computer model)
II.  Add the computer to three Active Directory groups: gpo-appv, gpo-adobe reader, con-microsoft-office
III. Move the computer to the Unassigned Organizational Unit


