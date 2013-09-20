//
//  ACParallaxView.h
//  ParallaxDemo
//
//  Created by Arnaud Coomans on 6/11/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "OrientationAnalyzer.h"

@class ACParallaxView;

@protocol ACParallaxViewDelegate <NSObject>
@optional
- (void)parallaxViewWillBeginParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewDidBeginParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewWillEndParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewDidEndParallax:(ACParallaxView*)parallaxView;
- (void)parallaxView:(ACParallaxView*)parallaxView didCheckAcceleration:(CMAcceleration)acceleration offsetX:(int)x offsetY:(int)y offsetZ:(int)z;
@end

@interface ACParallaxView : UIView<OrientationAnalyzerDelegate>

@property (nonatomic, weak) id<ACParallaxViewDelegate> parallaxDelegate;
@property (nonatomic, assign, getter = isParallax) BOOL parallax;

@property (nonatomic, strong, readonly) CMMotionManager *sharedMotionManager;

@end
