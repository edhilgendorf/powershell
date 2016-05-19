# Import the csv as a variable
# IMPORTANT: change -header parameters to match the first line of the CSV, and the path should be where your
# comma delimited CSV exists.
$data = Import-Csv C:\Users\USER$\Documents\ps\adFinal.txt -header("Full Name","Last Name","pTitle","nTitle","Account Management","SamAccountName","DistinguishedName","Manager")

#Iterate through each object (line) in the CSV
$data|ForEach-Object{
    cls

    #Check if field is empty to skip NULL fields
    if ($._nTitle -nq "")
    {
	#Echo the current information of the user to terminal
        get-aduser -Identity $_.SamAccountName -Properties sAMAccountName, title
        echo "Change job title to: "
        echo $_.nTitle
        echo ""
        
	# get confirmation of above information before proceeding
	$confirmation = Read-Host "Are you Sure You Want To Proceed y/(n)"

	#check if user enters 'y', if not, the field is NOT updated and it continues
	#to the next object in the CSV
        if ($confirmation -eq 'y') {
		
	   # use set-aduser to change a property, in this example, the title  
    	   Set-ADUser -Identity $_.samAccountName -title $_.nTitle
        }
    }
}


