/***********************************************************************
    File: mainBot.ch
***********************************************************************/
/****************************************************
Initializing
*****************************************************/
#include <linkbot.h>

/*  Format of the LinkbotLs
     ___
    |   |
    | 1 |
    |___|
    
     ___
    |   |
    | 2 |
    |___|
*/

//Define linkbots
robot1 = robot.connectWithSerialID(”serialID1”);
robot2 = robot.connectWithSerialID(”serialID2”);

CLinkbotL robot1, robot2;

robot1.resetToZeroNB(); robot2.resetToZeroNB(); //zero position

int main(){

/***************************************************
Determining if there is coordinate data to download
****************************************************/
//import data from quality bot
//if data is empty
    i = 0;
//elseif data is full
    i = 1;
    
if i = 1 
    var = 'yes';
else if i = 0
    var = 'no';

    switch(var) {

/*******************************************
No data to import from quality bot (default)
********************************************/
        case 'no':
            //set direction variable to be positive 
            //lower plunger to desired height
            //move foward by some increment
            //while loop
                //if at origin
                    //break out of loop
                // elseif senses blue
                    //if positive direction 
                        //turn right 180 deg
                    //else if 
                        //turn left 180 deg
                //else 
                    //move foward
            
            //break

/*******************************************
Data to import from quality bot
********************************************/
        case 'yes':
            //
    }

    return 0;
}
    
    
    
