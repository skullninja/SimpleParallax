//
//  ACParallaxView.m
//  ParallaxDemo
//
//  Created by Arnaud Coomans on 6/11/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACParallaxView.h"
#import <math.h>
#import <QuartzCore/QuartzCore.h>


static CMMotionManager *sharedMotionManager;


@implementation ACParallaxView


#pragma mark - accessors

- (void)setParallax:(BOOL)parallax {
    _parallax = parallax;
    if (parallax) {
        [self beginParallaxUpdates];
    } else {
        [self endParallaxUpdates];
    }
}

#pragma mark - motion

+ (CMMotionManager*)sharedMotionManager {
    if (!sharedMotionManager) {
        sharedMotionManager = [[CMMotionManager alloc] init];
    }
    return sharedMotionManager;
}

+ (void)setSharedMotionManager:(CMMotionManager*)motionManager {
    sharedMotionManager = motionManager;
}


- (void)beginParallaxUpdates {
    
    CMMotionManager *motionManager = [self.class sharedMotionManager];
    
    OrientationAnalyzer *analyzer = [[OrientationAnalyzer alloc] init];
    analyzer.delegate = self;
    
    if (motionManager.deviceMotionAvailable) {
        
        if ([self.parallaxDelegate respondsToSelector:@selector(parallaxViewWillBeginParallax:)]) {
            [self.parallaxDelegate parallaxViewWillBeginParallax:self];
        }
        
        [motionManager
         startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
         withHandler: ^(CMDeviceMotion *motion, NSError *error) {
             
             [analyzer addDeviceMotionGravity:motion.gravity];
             
         }];
    }
}

- (void)endParallaxUpdates {
    CMMotionManager *motionManager = [self.class sharedMotionManager];
    if ([motionManager isDeviceMotionActive] == YES) {
        
        if ([self.parallaxDelegate respondsToSelector:@selector(parallaxViewWillEndParallax:)]) {
            [self.parallaxDelegate parallaxViewWillEndParallax:self];
        }
        
        [motionManager stopDeviceMotionUpdates];
        
        if ([self.parallaxDelegate respondsToSelector:@selector(parallaxViewDidEndParallax:)]) {
            [self.parallaxDelegate parallaxViewDidEndParallax:self];
        }
    }
}

- (void)devicePositionUpdated:(int)devicePosition andGravity:(CMAcceleration)gravityVector offsetX:(int)x offsetY:(int)y offsetZ:(int)z {
    if ([self.parallaxDelegate respondsToSelector:@selector(parallaxView:didCheckAcceleration:offsetX:offsetY:offsetZ:)]) {
        [self.parallaxDelegate parallaxView:self didCheckAcceleration:gravityVector offsetX:x offsetY:y offsetZ:z];
    }
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DMakeTranslation(x, y, z);
    
    self.layer.transform = transform;
}

@end
