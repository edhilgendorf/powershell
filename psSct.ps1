#Import the csv as a variable
$data = Import-Csv C:\Users\hilgendorfe\Documents\ps\adFinal.txt -header("Full Name","Last Name","pTitle","nTitle","Account Management","SamAccountName","DistinguishedName","Manager")

#Iterate through each SamAccountName in the CSV
$data|ForEach-Object{
    cls
    if ($._nTitle -nq "")
    {
        get-aduser -Identity $_.SamAccountName -Properties sAMAccountName, title
        echo "Change job title to: "
        echo $_.nTitle
        echo ""
        $confirmation = Read-Host "Are you Sure You Want To Proceed y/(n)"
        if ($confirmation -eq 'y') {  
    	   #Set-ADUser -Identity $_.samAccountName -title $_.nTitle
           echo "pseudo-set the new title!"
        }
    }
}


