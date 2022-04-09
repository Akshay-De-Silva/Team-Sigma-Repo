#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

//For this we need to downlode the esp8266 2.3.0 library

int ledpinwhite = D4; //defining the OUTPUT pin for LED (D4)
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
  pinMode(ledpinwhite,OUTPUT); // Defining Pinmode for ledpin(D4)
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
     digitalWrite(ledpinwhite, HIGH);// Switching ON the main led bulb
   
   }

   if (light == "OFF")
  {
    //Switching OFF the main and the other led bulbs
    digitalWrite(ledpinwhite, LOW);
    analogWrite(ledpinwhite, 0);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    

  }

  //Here we're controlling the voltage of the bulb in order to controll the brightness/.

 if(light=="0")
  {
    analogWrite(ledpinwhite,0);
 
   }
   
  if(light=="10")
  {
    analogWrite(ledpinwhite,10);
 
   }
  if(light=="20")
  {
    analogWrite(ledpinwhite,20);
 
   }
  if(light=="30")
  {
    analogWrite(ledpinwhite,30);
 
   }
  if(light=="40")
  {
    analogWrite(ledpinwhite,40);
 
   }
  if(light=="50")
  {
    analogWrite(ledpinwhite,50);
 
   }
  if(light=="60")
  {
    analogWrite(ledpinwhite,60);
 
   }
  if(light=="70")
  {
    analogWrite(ledpinwhite,70);
 
   }
  if(light=="80")
  {
    analogWrite(ledpinwhite,80);
 
   }
  if(light=="90")
  {
    analogWrite(ledpinwhite,150);
 
   }
  if(light=="100")
  {
    analogWrite(ledpinwhite,255);
 
   }

   // End of controlling the voltage


   //Colour change begins here.

     if (light == "red")
  {
    digitalWrite(ledpinwhite, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpinred, HIGH);

  }
  if (light == "green")
  {
    digitalWrite(ledpinwhite, LOW);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpingreen, HIGH);

  }
  if (light == "blue")
  {

    digitalWrite(ledpinwhite, LOW);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinyellow, LOW);
    digitalWrite(ledpinblue, HIGH);

  }
  if (light == "yellow")
  {
    // analogWrite(ledpinred,255);
    // analogWrite(ledpinred,255);
    analogWrite(ledpinwhite, 0);
    digitalWrite(ledpinwhite, LOW);
    digitalWrite(ledpinred, LOW);
    digitalWrite(ledpingreen, LOW);
    digitalWrite(ledpinblue, LOW);
    digitalWrite(ledpinyellow, HIGH);

  }
    // Creating the light temperature
  if(light=="red1blue1")
  {
    analogWrite(ledpinred, 255);
    analogWrite(ledpinblue, 0);
  }
  if(light=="red2blue2")
  {
    analogWrite(ledpinred, 150);
    analogWrite(ledpinblue, 10);
  }
   if(light=="red3blue3")
  {
    analogWrite(ledpinred, 80);
    analogWrite(ledpinblue, 20);
  }
   if(light=="red4blue4")
  {
    analogWrite(ledpinred, 70);
    analogWrite(ledpinblue, 30);
  }
   if(light=="red5blue5")
  {
    analogWrite(ledpinred, 60);
    analogWrite(ledpinblue, 40);
  }
   if(light=="red6blue6")
  {
    analogWrite(ledpinred, 50);
    analogWrite(ledpinblue, 50);
  }
   if(light=="red7blue7")
  {
    analogWrite(ledpinred, 40);
    analogWrite(ledpinblue, 60);
  }
   if(light=="red8blue8")
  {
    analogWrite(ledpinred, 30);
    analogWrite(ledpinblue, 70);
  }
   if(light=="red9blue9")
  {
    analogWrite(ledpinred, 10);
    analogWrite(ledpinblue, 150);
  }
   if(light=="red10blue10")
  {
    analogWrite(ledpinred, 0);
    analogWrite(ledpinblue, 255);
  }
  
  
  }
