//Noah Gertsch & Til Bäckman








//Verwenden von libraris

#include "DHT.h"
#include "rgb_lcd.h"
#include <MHZ19.h>


// Pins Deklariren
int SENSOR_DHT = 7;
int DataPin = 6;

// Range für Co2 Messung
int ppmrange = 5000;
unsigned long pwmtime;

//Deklariert Variabel PPM
int PPM = 0;
float pulsepercent=0;


// Sensortyp festlegen
// DHT22 oder DHT11
# define SensorTyp DHT22


// Sensor DHT einen Namen zuweisen
DHT dht(SENSOR_DHT, SensorTyp);


// LCD einen Namen zuweisen (lcd)
rgb_lcd lcd;

// Temo und rf definieren
float Temp = 0;
float rF = 0;

//Funktion um Display zu löschen
void cleardisplay()
{
   lcd.clear();
}


//Setup
void setup()
{
  //Display Grösse und farbe definieren
    lcd.begin(16, 2);
    lcd.setRGB(255, 0, 0);
    lcd.clear();

  dht.begin();
}


//Main Loop
void loop()
{
  // Temp und rf einlesen
  Temp = dht.readTemperature();
  rF = dht.readHumidity();


  // Setzt die Temp und rf werte in strings
  String AnzeigeTemperatur = String(Temp);
  AnzeigeTemperatur.replace(".", ",");
  String AnzeigeLuftfeuchtigkeit = String(rF);
  AnzeigeLuftfeuchtigkeit.replace(".", ",");

  //Legt ort für Temp fest
  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.setCursor(5, 0);
  lcd.print(AnzeigeTemperatur + "\337C");

  // Legt ort für rf fest
  lcd.setCursor(0, 2);
  lcd.print("rF: ");
  lcd.setCursor(5, 3);
  lcd.print(AnzeigeLuftfeuchtigkeit + " %");

  // mindestens 2 Sekunden Pause
  delay(3000);

//Funktion für Display löschen
  cleardisplay();

  //einlesen von co2
  pwmtime = pulseIn(DataPin, HIGH, 2000000) / 1000;
  float pulsepercent = pwmtime / 1004.0;
  PPM = ppmrange * pulsepercent;

  //Co2 auf Display ausgeben
  lcd.print("Co2 PPM:");
  lcd.print(PPM );

  //2s warten
  delay(100);


    //LED Farben Wechseln
    {
      for (int i = 0; i < 255; i++) {
      lcd.setRGB(i, 255 - i, 0); // Ändere die RGB-Farben
      delay(5); // Verzögerung zwischen den Farbänderungen
    }

   for (int i = 0; i < 255; i++) {
    lcd.setRGB(255 - i, 0, i); // Ändere die RGB-Farben
    delay(5);// Verzögerung zwischen den Farbänderungen
   }

   for (int i = 0; i < 255; i++) {
    lcd.setRGB(0, i, 255 - i); // Ändere die RGB-Farben
    delay(5);// Verzögerung zwischen den Farbänderungen
   
  }
  
  }

}



