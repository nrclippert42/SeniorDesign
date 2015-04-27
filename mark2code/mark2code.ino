 int data=0;
 const int sensorPin=A0; 

void setup() {
 Serial.begin(9600);
}

void loop() {
  data=analogRead(sensorPin);
  Serial.println(data, DEC);
  delay(1000);
}

