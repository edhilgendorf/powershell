Mass Update Active Directory from CSV

This script will iterate through each object in a CSV and update a property
in the corresponding Active Directory Object's object.

Minor modifcations to the script are necessary depending on the CSV. If working
with an Excel file, you must save it as a CSV that utilizes comma delimeters.

You must change the -header parameters to match the first line of the CSV, this would be
the first row that contains the types of data in each column.

EX:

Name  |  Title  |  Location

Your -header should look like -header("Name", "Title", "Location)


This script is set to update Job titles from the nTitle field in the spreadsheet/CSV.
To mass-update another field, you only need to modify the line after the IF statement:

EX:

Set-ADUser -Identity $_.samAccountName -title $_.nTitle  # This example modifies the 
							 # jobtitle (-title) property
							 # of the samaccountname field
							 # in the CSV.



A full list of properties for Set-ADUser that can be modified can be found here: 
https://technet.microsoft.com/en-us/library/ee617215.aspx



You may also substitute this line with Set-ADComputer and change even more properties.

EX:     Set-ADComputer $_.samAccountName -Description $._desc # This example changes the 
							      # description field of the
							      # current object.

A full list of properties for Set-ADComputer that can be modified can be found here:
https://technet.microsoft.com/en-us/library/ee617263.aspx


There is a adTest.txt file that may be used that only modifies two accounts to test for
errors before implementation against an entire data-set.