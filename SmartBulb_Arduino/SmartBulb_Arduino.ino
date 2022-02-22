#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

//For this we need to downlode the esp8266 2.3.0 library

int ledpin = D4; //defining the OUTPUT pin for LED (D4)
int ledpinred = D5;
int ledpingreen = D6;
int ledpinblue  = D7;
int ledpinyellow = D8;

// Set these to run example.
#define FIREBASE_HOST "smart-bulb-app-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "JFbxlu6LCrWIiAICSIyrNGNBYEEtBlm0mxfi9kIe"
#define WIFI_SSID "Dialog 4G 266"
#define WIFI_PASSWORD "9743DFF1"

void setup() {
  pinMode(ledpin,OUTPUT);
  pinMode(ledpinyellow,OUTPUT);
  pinMode(ledpinred,OUTPUT);
  pinMode(ledpingreen,OUTPUT);
  pinMode(ledpinblue,OUTPUT);

}



void loop()
{
  
  
  }
