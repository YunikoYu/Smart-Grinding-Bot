/*  File: qualityBot.ch
 *  This program uses 1 Linkbot-I to control the drive 
 *  of the quality bot and to record the position.
 *  
 *  Top View
 *   
 *   robot
 *    ___
 *   |   |
 *  1|   |2
 *   |___|
 *
 *
 */

/****************************************************
Initializing
*****************************************************/
#include <linkbot.h>
#include <chplot.h>

//Define linkbots
robot = robot.connectWithSerialID(”serialID1”);

CLinkbotI robot;
double radius = 1.75 //radius of 1.75 inches
double trackwidth = 3.69;  // the track width, the distance between two wheels
double timeInterval = 0.1; // time interval in 0.1 second 
int numDataPoints;         // number of data points recorded
robotRecordData_t xdata, ydata; // recorded x and y positions 
CPlot plot;                // plotting class

//Origin position

double x,y,ori;
x=0,; y=0; angle1=90;
robot.initPosition(x,y,angle1); //zero position

int main(){

/***************************************************
Move and record the path
****************************************************/            
/* begin recording x and y positions */
robot.recordxyBegin(xdata, ydata, timeInterval);          

//move forward

          while (1) {
              robot.traceOn();
              if (x=0 && y = 0 && angle=0) //if at origin
                  robot.traceOff();
                  break; //break out of loop
             
              // elseif senses blue, turn depending on the orientation   
                  if(y % 2 == 0) //positive direction
                      /*turn right 180 deg*/
                      robot.moveJointToNB(JOINT1, -180);
                      robot1.moveJointToNB(JOINT1, 180);
                  else 
                      /*turn left 180 deg*/
                      robot1.moveJointToNB(JOINT1, 180);
                      robot1.moveJointToNB(JOINT1, -180);
               robot.//move foward
               
       
              }

/* end recording x and y positions */
robot.recordxyEnd(numDataPoints);


    }

    return 0;
}
    
    
    
