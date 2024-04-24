/* Nicht anfällig für sqli */

<?php
session_start(); // Starte die PHP-Sitzung

// Datenbankverbindung herstellen
$database_host = "database"; // Name des MySQL-Containers
$database_user = "root"; // Benutzername für die MySQL-Datenbank
$database_password = $_ENV['MYSQL_ROOT_PASSWORD']; // Passwort für die MySQL-Datenbank
$database_name = "Test"; // Name der MySQL-Datenbank
$port = 3306; // Port für die MySQL-Verbindung

$link = mysqli_connect($database_host, $database_user, $database_password, $database_name, $port);

// Überprüfe die Verbindung
if (!$link) {
    die("Verbindung zur MySQL-Datenbank fehlgeschlagen: " . mysqli_connect_error());
}

// Überprüfe, ob der Benutzer bereits angemeldet ist
if(isset($_SESSION['username']))
{
    echo "Ey Yo Mister White, du bisch scho agmolde du lappe";
 exit();
}

// Überprüfe, ob das Formular abgeschickt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Benutzername und Passwort aus dem Formular erhalten
    $input_username = $_POST['name'];
    $input_password = $_POST['passwort'];

    // Vorhandene Anweisung vorbereiten
    $sql = "SELECT * FROM user WHERE name=? AND passwort=?";
    $stmt = mysqli_prepare($link, $sql);

    // Parameter binden
    mysqli_stmt_bind_param($stmt, "ss", $input_username, $input_password);

    // Anweisung ausführen
    mysqli_stmt_execute($stmt);

    // Ergebnis abrufen
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        // Anmeldung erfolgreich, speichere den Benutzernamen in der Sitzung
        $_SESSION['username'] = $input_username;
    header("Location: login.html");
    exit();

    } else {
        $login_error = "Ungültiger Benutzername oder Passwort.";
    }

    // Anweisung schließen
    mysqli_stmt_close($stmt);
}

// Datenbankverbindung schließen
mysqli_close($link);
?>
