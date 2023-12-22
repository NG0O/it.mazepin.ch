##G2 Noah##

#Punkt 1: Alle Services in einer Variable gespeichert
$serv = Get-Service


#Punkt 2: Ausgaben von $serv absteigend sortiert nach status.
$serv | Select DisplayName, Status, CanStop -last 5 | Sort-Object status -descending


#punkt 3: Neue datei erstellen und Erstelldatum anzeigen.
cd 'C:\Users\Noah\Downloads\'
New-Item 'C:\Users\Noah\Downloads\Test2.txt'
get-ChildItem -path 'C:\Users\Noah\Downloads\Test2.txt' | select creationtime


#Punkt 4: Erstellzeit der in Punkt 3 erstellten Datei ändern
(Get-Item 'C:\Users\Noah\Downloads\Test2.txt').CreationTime = get-date


#Punkt 5: Alle Prozesse, deren id grösser als 1000 ist und dann die letzten 5 (aufsteigend sortiert)
get-process | Sort-Object id | select id -last 5 | where id -ge 1000


#Punkt 6: notepad starten und id bestimmen
Start-Process notepad.exe
Get-Process -notepad.exe

#Id kann nicht geändert werden


#Punkt 7: (notepad wieder stoppen und beweisen)
Stop-Process -name notepad
get-process notepad


#Punkt 8: Ordnerstruktur mit zwei ebenen und Dateien ordner in ebene 1 kopieren
cd C:\
cd "C:\HTML"
mkdir "Ordner 1"
cd ".\Ordner 1"
mkdir "Ordner 2"copy-item -Path 'C:\F.txt' -Destination 'C:\HTML\Ordner 2'


#Punkt 9: alle Dateien der ersten Ebene in die zweite verschieben
get-childitem -Path 'C:\Users\Noah\Test1' | where length -ge 100KB | move-item -Destination 'C:\Users\Noah\Test1\Test2'


#Punkt 10: alle Inhalte als Liste der zwei ebeben
Get-Childitem -path 'C:\Users\Noah\Test1', 'C:\Users\Noah\Test1\Test2' | select length,name, fullname -last 5



