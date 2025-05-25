#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

// Wi-Fi credentials
#define WIFI_SSID "Redmi"
#define WIFI_PASSWORD "98764321"

// Firebase project credentials
#define FIREBASE_HOST "https://iotproject-8d4de-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "81pEGY41RPBiiYRrV84snbZCyQbylowhwnDpVY07"

// Define pins
#define RELAY_PIN D1
#define SOIL_PIN A0

// Firebase objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

void setup() {
  Serial.begin(115200);

  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW); // Motor OFF initially

  // Connect to Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println(" Connected!");

  // Firebase Config setup
  config.host = FIREBASE_HOST;
  config.signer.tokens.legacy_token = FIREBASE_AUTH;

  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop() {
  // Read soil moisture
  int moisture = analogRead(SOIL_PIN);
  Serial.print("Soil Moisture: ");
  Serial.println(moisture);

  // Upload moisture to Firebase
  if (Firebase.setInt(fbdo, "/sensor/moisture", moisture)) {
    Serial.println("Moisture sent");
  } else {
    Serial.print("Send failed: ");
    Serial.println(fbdo.errorReason());
  }

  // Check motor control from Firebase
if (Firebase.getBool(fbdo, "/motor/manual")) {
    bool motorManual = fbdo.boolData();  // Get the boolean value

    if (motorManual) {
      digitalWrite(RELAY_PIN, HIGH);  // Turn ON motor
      Serial.println("Motor Status: ON");
    } else {
      digitalWrite(RELAY_PIN, LOW);   // Turn OFF motor
      Serial.println("Motor Status: OFF");
    }
} else {
    Serial.print("Failed to read motor/manual: ");
    Serial.println(fbdo.errorReason());
}


  delay(5000);
}
