//
//  Geometry.m
//  GameWithNoName
//
//  Created by mike.tihonchik on 11/4/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "Geometry.h"

@implementation Geometry

/*
 * line is (x1,y1) to (x2,y2), point is (x3,y3)
 * return (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1);
 */
-(NSString *)determinePointPosition:(float) currentPositionX currentY:(float) currentPositionY {
    float endpointX, endpointY;
    float startX = 240;
    float startY = 160;
    int quadrant;
    NSString *direction;
    
    if(currentPositionX < startX && currentPositionY > currentPositionY) {
        endpointX = 0;
        endpointY = 320;
        quadrant = 1;
    } else if(currentPositionX > startX && currentPositionY > currentPositionY) {
        endpointX = 320;
        endpointY = 320;
        quadrant = 2;
    } else if(currentPositionX > startX && currentPositionY < currentPositionY) {
        endpointX = 320;
        endpointY = 0;
        quadrant = 3;
    } else {
        endpointX = 0;
        endpointY = 0;
        quadrant = 4;
    }
    
    float result = (endpointX - startX) * (currentPositionY - startY) - (endpointY - startY) * (currentPositionX - startX);
    
    if(quadrant == 1) {
        if(result > 0) {
            direction = @"left";
        } else {
            direction = @"up";
        }
    } else if(quadrant == 2) {
        if(result > 0) {
            direction = @"up";
        } else {
            direction = @"right";
        }
    } else if(quadrant == 3) {
        if(result > 0) {
            direction = @"right";
        } else {
            direction = @"down";
        }
    } else {
        if(result > 0) {
            direction = @"down";
        } else {
            direction = @"left";
        }
    }
    return direction;
}

@end
