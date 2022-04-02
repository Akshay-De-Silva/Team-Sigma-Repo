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

//Testing phase 02 Git
void setup() {
  pinMode(ledpin,OUTPUT); // Defining Pinmode for ledpin(D4)
  pinMode(ledpinyellow,OUTPUT);// Defining Pinmode for ledpinyellow(D8)
  pinMode(ledpinred,OUTPUT);// Defining Pinmode for ledpinred(D5)
  pinMode(ledpingreen,OUTPUT);// Defining Pinmode for ledpingreen(D6)
  pinMode(ledpinblue,OUTPUT);// Defining Pinmode for ledpinblue(D7)

  Serial.begin(9600);
  delay(500);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  yield();
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  digitalWrite(D8,HIGH);
  delay(1000);
  digitalWrite(D8,LOW);
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}




//Testing
String light = "";// assigning a String Variable named as light 
void loop()
{
   light = Firebase.getString("Light/Switch");
   Serial.println(light);
   if (light == "ON")
   {
     digitalWrite(ledpin, HIGH);// Switching ON the main led bulb
   
   }

   if (light == "OFF")
  {
    //Switching OFF the main and the other led bulbs
    digitalWrite(ledpin, LOW);
    analogWrite(ledpin, 0);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    

  }

  //Here we're controlling the voltage of the bulb in order to controll the brightness/.

 if(light=="0")
  {
    analogWrite(ledpin,0);
 
   }
   
  if(light=="10")
  {
    analogWrite(ledpin,10);
 
   }
  if(light=="20")
  {
    analogWrite(ledpin,20);
 
   }
  if(light=="30")
  {
    analogWrite(ledpin,30);
 
   }
  if(light=="40")
  {
    analogWrite(ledpin,40);
 
   }
  if(light=="50")
  {
    analogWrite(ledpin,50);
 
   }
  if(light=="60")
  {
    analogWrite(ledpin,60);
 
   }
  if(light=="70")
  {
    analogWrite(ledpin,70);
 
   }
  if(light=="80")
  {
    analogWrite(ledpin,80);
 
   }
  if(light=="90")
  {
    analogWrite(ledpin,150);
 
   }
  if(light=="100")
  {
    analogWrite(ledpin,255);
 
   }

   // End of controlling the voltage


   //Colour change begins here.

     if (light == "red")
  {
    digitalWrite(ledpin, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpinred, HIGH);

  }
  if (light == "green")
  {
    digitalWrite(ledpin, LOW);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpingreen, HIGH);

  }
  if (light == "blue")
  {

    digitalWrite(ledpin, LOW);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpinblue, HIGH);

  }
  if (light == "yellow")
  {
    // analogWrite(ledpinred,255);

  }
  
  
  }
