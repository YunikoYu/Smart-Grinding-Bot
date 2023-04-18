/*  File: mainBot.ch
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
 *  1| 2 |
 *   |___|
 *     |
 *     | <----------connector
 *    _|_
 *   |   |
 *   | 2 |1
 *   |___|
 *   robot2
*/

/****************************************************
Initializing
*****************************************************/
#include <linkbot.h>

//Define linkbots
robot1 = robot.connectWithSerialID(”serialID1”);
robot2 = robot.connectWithSerialID(”serialID2”);

CLinkbotL robot1, robot2;
double angle = 250;
robot1.resetToZeroNB(); robot2.resetToZeroNB(); //zero position
int dir = 0;//set positive direction

int main(){

/***************************************************
Determining if there is coordinate data to download
****************************************************/
    int i;
    char var;
    
    //import data from quality bot
    //if data is empty
        i = 0;
    //elseif data is full
        i = 1;
    
    if(i = 1) 
        var = 'yes';
    else if(i = 0)
        var = 'no';

    switch(var) {

/*******************************************
No data to import from quality bot (default)
********************************************/
        case 'no':
            //lower plunger to desired height
            
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

/*******************************************
Data to import from quality bot
********************************************/
        case 'yes':
            //
    }

    return 0;
}
    
    
    
