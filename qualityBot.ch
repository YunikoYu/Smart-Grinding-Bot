/*  File: qualityBot.ch
 *  This program uses 2 Linkbot-Ls to make a two-whel omnidrive robot
 *  where each wheel can turn. 
 *  The robots are connected to the grinding bot frame,
 *  where joint 2 controls the plunger system and 
 *  joint 1 controls the wheels.
 *  
 *  Top View
 *   
 *   robot1
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

//Define linkbots
robot1 = robot.connectWithSerialID(”serialID1”);

CLinkbotI robot1;
robot1.resetToZeroNB(); //zero position
int dir = 0;//set positive direction

int main(){

/***************************************************
Move and record the path
****************************************************/            
          /*move foward by some increment*/
          robot1.moveNB(-angle,0,NaN);
          robot2.moveNB(angle,0,NaN);

          while (1) {
              //if at origin
                  //break out of loop
              // elseif senses blue
                  if(dir % 2 == 0) //positive direction
                      /*turn right 180 deg*/
                      robot1.moveJointToNB(JOINT1, -180);
                      robot1.moveJointToNB(JOINT1, 180);
                  else 
                      /*turn left 180 deg*/
                      robot1.moveJointToNB(JOINT1, 180);
                      robot1.moveJointToNB(JOINT1, -180);
              //else 
                  //move foward
              dir = dir++;
              }

          break;

    }

    return 0;
}
    
    
    
