#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

//For this we need to downlode the esp8266 2.3.0 library

int ledpin = D4; //defining the OUTPUT pin for LED (D4)
int ledpinred = D5;//defining the OUTPUT pin for LED (D5)
int ledpingreen = D6;//defining the OUTPUT pin for LED (D6)
int ledpinblue  = D7;//defining the OUTPUT pin for LED (D7)
int ledpinyellow = D8;//defining the OUTPUT pin for LED (D8)

// Set these to run example.
#define FIREBASE_HOST "smart-bulb-app-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "JFbxlu6LCrWIiAICSIyrNGNBYEEtBlm0mxfi9kIe"
#define WIFI_SSID "Dialog 4G 266"
#define WIFI_PASSWORD "9743DFF1"

//Just for testing123
void setup() {
  pinMode(ledpin,OUTPUT); // Defining Pinmode for ledpin(D4)
  pinMode(ledpinyellow,OUTPUT);// Defining Pinmode for ledpinyellow(D8)
  pinMode(ledpinred,OUTPUT);// Defining Pinmode for ledpinred(D5)
  pinMode(ledpingreen,OUTPUT);// Defining Pinmode for ledpingreen(D6)
  pinMode(ledpinblue,OUTPUT);// Defining Pinmode for ledpinblue(D7)

}


//Testing
void loop()
{
  
  
  }
