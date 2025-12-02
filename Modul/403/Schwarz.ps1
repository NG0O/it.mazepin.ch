# Spiel zahlen erraten#
#Noah Gertsch#
#V0.1 25.01.22#
# Man kann zahlen erraten in dem das programm eine zufalls zahl generiet und man dan sollange rät bis man es richte hat#

#Alle variabeln deklariren und bei 7 versuch aufhören struktogramm zeichnen##############################

$raten = $true  # Variable für die Wiederholung der Abfragen

$zahl = Get-Random -Minimum 0 -Maximum 100  # Die zu erratende Zahl wird zufällig gezogen

$versuche = 0  # Variabel für die gebrauchten versuche

while($raten)  # Die Schleife die das raten ermöglicht
{
    $versuche++ # Bei jedem rate versuch wird +1 zu der variabel $versuche hinzugefügt

    $eingabe = read-host "Bitte raten Sie die Zahl zwischen 1 und $max ($versuche)"  # Auforderung für den Spieler ausgeben und Werte einlesen
    
    $out = 0                                       # Die Eingabe des Benutzers in eine Zahl umwandeln, wenn möglich
    if([int32]::TryParse($eingabe, [ref] $out)) {
        if($eingabe -gt $zahl) {                   # Prüft ob die geratetet zahl zu hoch ist, wen ja fehler meldung und widerholte aufforderug zum zahl eingeben
            "Ihre Eingabe war zu hoch."
        } elseif($eingabe -lt $zahl) {             # Prüft ob die geratetet zahl zu klein ist, wen ja fehler meldung und widerholte aufforderug zum zahl eingeben.
            "Ihre Eingabe war zu niedrig."
        } else {                                   # Die Zahl wurde erraten. Schleife abbrechen und gewinner melung ausgeben
            $raten = $false
        }
    } else {
        "Ungültige Eingabe: $eingabe"              # Umwandlung in eine Zahl nicht möglich - Fehler
    }
}

Write-Host "Geschaft! sie habe die Zahl in $versuche erraten!"