double time = 0;
double value = 0;
double value2 = 0;
const float Pi = 3.14159;

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(11520);
}

void loop() {
  // print the results to the serial monitor:
  Serial.print(value);
  Serial.print(" ");
  Serial.println(value2);
  
  value = sin(time);
  value2 = sin(2*time);
  
  time = time + Pi/8;
  if(time >= 2*Pi) {
    time = 0;
  }
}
