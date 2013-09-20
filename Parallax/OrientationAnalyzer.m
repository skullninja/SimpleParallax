//
//  OrientationAnalyzer.m
//  Parallax
//
//  Created by David Peck on 9/20/13.
//  Copyright (c) 2013 Skull Ninja Labs. All rights reserved.
//

#import "OrientationAnalyzer.h"

#define ORIENTATION_THRESHOLD 70

@interface OrientationAnalyzer ()

@end

@implementation OrientationAnalyzer


- (void)addDeviceMotionGravity:(CMAcceleration)gravityVector {
    
    // Device Orientation
    int theDevicePosition = 0; // 0,1,2
    
    if (abs(gravityVector.x*100.0) > ORIENTATION_THRESHOLD) {
        theDevicePosition = 0; // On Side
    }else if (abs(gravityVector.y*100.0) > ORIENTATION_THRESHOLD) {
        theDevicePosition = 1; // Standing Up
    } else if (abs(gravityVector.z*100.0) >= ORIENTATION_THRESHOLD){
        theDevicePosition = 0; // On Back
    }
    
    self.devicePosition = theDevicePosition;
    
    float offsetFactor = -0.5;
    
    int offsetX = (int)(gravityVector.x*100.0 * offsetFactor);
    int offsetY = (int)(gravityVector.y*100.0 * offsetFactor * -1);
    int offsetZ = 0;
    
    if (self.delegate) {
        [self.delegate devicePositionUpdated:self.devicePosition andGravity:gravityVector offsetX:offsetX offsetY:offsetY offsetZ:offsetZ];
    }
}

@end
