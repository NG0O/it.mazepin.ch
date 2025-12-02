[03.05.2022 16:01] Heuberger Kristian

# <O2P2>
#O2B2 Serie A Task B
# Version 1.2: <Heuberger, Gertsch, Winterleitner>, <02.05.2022>
# Variabellliste#
[string]$Auswahlsmenü = "" #Auswahlmenütext
[string]$menu = "" #Eingabe 0-3 für menu Punkt
[string]$Passwort = "" #Eingabe für Menüpunkt 1
[DateTime]$startzeit = get-date #Startzeit (vom letzten Tag)
[DateTime]$endzeit = get-date #endzeit (jetziges Datum)
[DateTime]$datum = get-date #Ausgabe für Menüpunkt 3



do{
$Auswahlsmenü = write-host "
Demo Robuste Eingabe mit Menu
-----------------------------
[1] Passwort überprüfung (Kleinschreibung)
[2] Ausrechnung von Minuten seit 12:34 des letzten Tages bis jetzt)
[3] Wie viel Dateien hat dieses Verzeichniss, welche grösser als 1KB sind?
[0] Programm beenden"
[string]$menu = Read-Host " -> Bitte ein Menupunkt eingeben"




#Menüpunkt 1
switch ($menu) { # Menü ausführen gemäss Wahl des Benutzers...
1 { write-host "1) Passwort überprüfung (Kelinbuchstaben)"
[string]$Passwort = read-host "Geben sie bitte ihr Passwort ein" # String
if ($Passwort -cmatch "[A-Z]") {
# =======




write-host "Sie haben ein Unerwünschtes Zeichen im Passwort!" -f red
}
else{
write-host "Vorgang Erfolgreich!" -f green
}
}
#Menüpunkt 2



2 { write-host "2) Ausrechnung von Minuten seit 12:34 des letzten Tages bis jetzt"
[datetime]$startzeit = "12:34:00"
[datetime]$endzeit = get-date
if ($endzeit -gt $startzeit){
$datum = New-TimeSpan -Start $startzeit -End $endzeit
$datum.TotalMinutes + 1440
}
else{
$datum = 1440 - $startzeit.Minute - $endzeit.Minute
$datum
}
}
#Menüpunkt 3
3 { write-host "3) Wie viel Dateien hat dieses Verzeichniss, welche grösser als 1KB sind?"
Get-ChildItem -Path C:\Users\linow\Desktop -Recurse -Include *.exe | Where-Object -FilterScript {($_.Length -ge 0.001mb) -and ($_.Length -le 1000000mb)}
}
#Menüpunkt 0
0 { write " 0) Programm beenden:"
[string]$wort = write-host "Chööö"
}
}
}
while ($menu -ne 0)

