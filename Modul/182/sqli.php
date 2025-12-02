/* Anfällig für sqli */

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
if(isset($_SESSION['username'])) {
    echo "Hey Yo Mister White, du bisch scho agmolde du depp";
    exit();
}
// Überprüfe, ob das Formular abgeschickt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Benutzername und Passwort aus dem Formular erhalten
    $input_username = $_POST['name'];
    $input_password = $_POST['passwort'];

    // Überprüfen, ob Benutzername und Passwort korrekt sind
    $sql = "SELECT * FROM user WHERE name='$input_username''- AND passwort='$input_password'";
    $result = mysqli_query($link, $sql);
  

    if (mysqli_num_rows($result) > 0) {
        // Anmeldung erfolgreich, speichere den Benutzernamen in der Sitzung
        $_SESSION['username'] = $input_username;
    header("Location: login.html");
    exit();

    } else {
        $login_error = "Ungültiger Benutzername oder Passwort.";
    }
}

mysqli_close($link);
?>

