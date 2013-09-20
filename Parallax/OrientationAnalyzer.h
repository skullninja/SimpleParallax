//
//  OrientationAnalyzer.h
//  Parallax
//
//  Created by David Peck on 9/20/13.
//  Copyright (c) 2013 Skull Ninja Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@protocol OrientationAnalyzerDelegate <NSObject>
@optional
- (void)devicePositionUpdated:(int)devicePosition andGravity:(CMAcceleration)gravityVector offsetX:(int)x offsetY:(int)y offsetZ:(int)z;
@end

@interface OrientationAnalyzer : NSObject

@property (assign) float gravityX;
@property (assign) float gravityY;
@property (assign) float gravityZ;
@property (assign) int devicePosition;

@property (weak, nonatomic) id<OrientationAnalyzerDelegate> delegate;

- (void)addDeviceMotionGravity:(CMAcceleration) gravityVector;

@end
