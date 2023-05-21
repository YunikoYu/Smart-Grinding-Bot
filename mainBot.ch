/*  File: mainBot.ch
 *  This program uses 2 Linkbot-Ls to make a two-wheel omnidrive robot
 *  where each wheel can turn. 
 *  The robots are connected to the grinding bot frame,
 *  where joint 2 controls the plunger system and 
 *  joint 1 controls the wheels.
 *  
 *  Top View
 * 
 *  Grinding Bot
 * 
 *   robot1
 *    __| <-------IR Sensor
 *   |   |
 *  1| 2 | <-------Arduino Connect
 *   |___|
 *     |
 *     | <----------plunger (with ultrasonic sensor)
 *    _|_
 *   |   |
 *   | 2 |1
 *   |___|
 *   robot2   
 *
 *
 *  Quality Bot
 *
 *   robot
 *    ___
 *   |   |
 *  1|   |3 
 *   |___|
 
*/

/****************************************************
Global Variables
*****************************************************/
#include <robot.h>

//Define linkbots
CLinkbotL robot1 = CLinkbotL("1HZW"); 
CLinkbotL robot2 = CLinkbotL("J1C7");
CLinkbotI robotQ = CLinkbotI("");

//Define Functions 
int plungUp();      // Move plunger up
int plungDown();    // Move plunger down
int Gfoward(angle); // Move grinding bot foward
int Gback(angle);   // Move grinding bot backwards
int GRight();       // Turn grinding bot right
int GLeft();        // Turn grinding bot left

int main(){
/****************************************************
Initializing Sensors
*****************************************************/
//Set mobility   
int speed = 50;  //Joint speed is deg/s
int angle = 180; //Next section distance
    
robot1.setJointSpeed(JOINT1, speed);
robot2.setJointSpeed(JOINT1, speed);
robotQ.setJointSpeeds(JOINT1, JOINT2, speed);

    
/*** Calibrate ultrasonic sensor for plunger ***/
double distance;
double start = 1.88; // starting height of plunger
int trigPin = 9; // connect the trigger pin to digital pin 9
int echoPin = 8; // connect the echo pin to digital pin 8
int plung = 380; // plunger height
int adjust = 60; // Adjustment angle 

// Set pins for ultrasonic sensor
robot1.pinMode(trigPin,OUTPUT);
robot1.pinMode(echoPin, INPUT);
distance = robot1.readUltrasoundSensor(trigPin, echoPin);

plungUp();

while (1) {
    if (distance > (start-0.01) && distance < (start+0.01)){
        printf("At starting height of %.2f inches\n", distance);
        distance = robot1.readUltrasoundSensor(trigPin, echoPin);
        printf("distance: %.2f inches\n", distance);
        break;
        }
    else if (distance > start){
        //move down
        plungDown();
        robot1.delaySeconds(2);
        distance = robot1.readUltrasoundSensor(trigPin, echoPin);
        }
    else {
        //move up
        plungUp();
        robot1.delaySeconds(2);
        distance = robot1.readUltrasoundSensor(trigPin, echoPin);
        }   
}

/*** Calibrate infared sensor ***/
int sensorPin = A0;
int midVal = 500;
int lightLevel_0;
int lightLevel_1;
int lightLevel_2;
double average;
double calibrate;

// Set the sensor input pin to input mode
robot2.pinMode(sensorPin, INPUT);

// calibrate the sensor
printf("Please position the line following sensor above a white piece of paper for 5 seconds...");
robot2.delaySeconds(3);

lightLevel_0 = robot2.analogRead(sensorPin);
robot2.delaySeconds(1);

lightLevel_1 = robot2.analogRead(sensorPin);
robot2.delaySeconds(1);

lightLevel_2 = robot2.analogRead(sensorPin);

calibrate = (lightLevel_0 + lightLevel_1 + lightLevel_2) / 3.0;


/***************************************************
Opening text file from the Quality Bot
****************************************************/
    FILE *stream; /* a file stream */
    double t; //reading file variable
    
    // open textfile for reading
    stream = fopen(".txt", "r");
    if(stream == NULL) {
        printf("Error: cannot open 'position1.txt' for reading\n");
        exit(-1);      
        }
        
    fscanf(stream, "%lf", &t); // read file for a 1 or 0
        
/***************************************************
Mobility Operations
****************************************************/
    while(1) {
        /*** Grind next Section ***/
        if (t == 1){
            plungDown();
            GFoward(angle);
            plungUp();
            }    
            
        /*** Grind previous Section ***/
        if (t == 0){
            plungDown();
            GBackward(angle);
            plungUp();
            GFoward();
            }  
        // FIGURE OUT WHEN TO BREAK OUT
    }    
     //~ while (1) {
                //~ int count = 0;

                //~ lightLevel_0 = robot2.analogRead(sensorPin);
                //~ lightLevel_1 = robot2.analogRead(sensorPin);
                //~ lightLevel_2 = robot2.analogRead(sensorPin);

                //~ // calculate the average between 3 sensor readings
                //~ average = (lightLevel_0 + lightLevel_1 + lightLevel_2) / 3.0;
                
                //~ // senses border
                //~ if (average >= calibrate + midVal) {  
                    //~ if(dir % 2 == 0) {//positive direction
                        //~ /*turn right 180 deg*/
                        //~ GRight();
                    //~ }else{ 
                        //~ /*turn left 180 deg*/
                        //~ GLeft();
                        //~ }
                //~ }
            //~ break;
            //~ }   
            
    fclose(stream);
    return 0;
}
    
/*******************************************
Global Functions
********************************************/
int plungUp(){
    robot1.moveNB(0,-360,NaN);
    robot2.move(0,-360,NaN);
    return 0;
    }
int plungDown(){
    robot1.moveNB(0,360,NaN);
    robot2.move(0,360,NaN);
    return 0;
    }
int Gfoward(angle){
    robot1.moveNB(angle,0,NaN);
    robot2.move(-angle,0,NaN);
    return 0;
    }
int Gback(angle){
    robot1.moveNB(-angle,0,NaN);
    robot2.move(angle,0,NaN);
    return 0;
    }
int GRight(){
    robot1.moveNB(180,0,NaN);
    robot2.move(180,0,NaN);
    return 0;
    }
int GLeft(){
    robot1.moveNB(180,0,NaN);
    robot2.move(180,0,NaN);
    return 0;
    }
