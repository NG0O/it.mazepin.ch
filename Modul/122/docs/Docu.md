# Doku zu Script 1 und 2

## Installation

`git clone https://gitlab.com/NG007/osticket_til_noah.git`

Dann kann man mit ./Script1.sh das script starten.

Auf dem System wo das Script laufen soll müssen im verzeichnis /var/opt folgende ordner erstellt werden:

- /var/opt/incoming_alerts
- /var/opt/incoming_alerts_done 
- /var/opt/error
- /var/opt/logs/log1

Zusätzlich muss im ordner /var/opt eine customer.csv datei sein wo die Kundendaten drin stehen



## Testen


Test 1

| Testfall | Testbeschreibung | Testdaten | erwartetes Testresultat | erhaltenes Testresultat | Tester | Testdatum und Teststatus |
|  - | - | - | - | - | - | - |
| Erstmaliger Aufruf | Das Skript soll mit einem input file aufgerufen werden, in welchem nur verfügbare Git-URLs sind. Diese sollen in ein noch nicht existierendes Verzeichnis geklont werden:<pre>git_clone_update_repos.bash repolist.txt /tmp/myrepos</pre> | repolist.txt mit folgendem Inhalt:<pre>https://gitlab.com/NG007/osticket_til_noah.gitt Noah Til| Verzeichnis wird erstellt und alle Repos werden darin geklont | Das erwartete ereigniss ist erfüllt und funktioniert. | NG TB| 24.01.23 |


Test 2

| Testfall | Testbeschreibung | Testdaten | erwartetes Testresultat | erhaltenes Testresultat | Tester | Testdatum und Teststatus |
|  - | - | - | - | - | - | - |
| Die Datei in Incoming Alertas ist leer| Es wird ein leeres test.txt in den ortner /var/opt/incoming_alerts erstellt. | leerse .txt | Moved die datei in den error ordner | Gleich wie erwartet | NG TB | 24.01.23


Test 3

| Testfall | Testbeschreibung | Testdaten | erwartetes Testresultat | erhaltenes Testresultat | Tester | Testdatum und Teststatus |
|  - | - | - | - | - | - | - |
|Wen Werte vorhanden, wird Ticket erstellt| Wenn beide Scripts ohne Fehler durchlaufen soll ein Ticket erstellt werden| alert.txt, customer.csv| Ticket wird in OSTicket generiert| Bis jetzt noch nicht funktional| NG TB| 25.01.23



## Variabel übergabe

Script 1 übergiebt dem Scrip2 folgenede variabel:

$1 Alert file in txt
$2 System name 
$3 Email
$4 Tele
$5 Sunbject


## Konfigurations Dateien:

Die werden im etc in den files con1.conf für script1 und conf2.conf für script 2 gespeichert.
Somit werden alle änderungen an z.B pfad oder sonstiges direkt in dem conf file.



## Log Files:

Sollten im pfad var/opt/log gespeichert.