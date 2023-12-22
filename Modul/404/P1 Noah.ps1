#Aufgabe 1

$str = "HALLO"

get-content -path C:\F.txt

(get-service -DisplayName "fax").ToString()




#Aufgabe 2

$str1 = "HALLO"
$str2 = (get-content -path C:\F.txt).ToString()
$str3 = (get-service -displayname "fax").ToString()




#Aufgabe 3

$str.Length

# int Length {get;} geht nur mit get

#4
$str.GetType()

$str.GetEnumerator()

$str.GetHashCode()

$str.GetTypeCode()


#Punkt 5

get-process | Format-wide

get-process | format-table

get-process |format-list

get-service | sort-object status -Descending



#Aufgabe 6

Get-service | Foreach-Object { write-host $_.status –foregroundcolor White -backgroundcolor blue $_.name $_.DisplayName}