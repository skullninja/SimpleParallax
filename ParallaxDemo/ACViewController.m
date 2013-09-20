//
//  ACViewController.m
//  ParallaxDemo
//
//  Created by Arnaud Coomans on 6/11/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ACViewController ()

@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.parallaxView.parallax = YES;
    self.parallaxView.parallaxDelegate = self;
}

#pragma mark - ACParallaxViewDelegate

- (void)parallaxView:(ACParallaxView*)parallaxView didCheckAcceleration:(CMAcceleration)acceleration offsetX:(int)x offsetY:(int)y offsetZ:(int)z {
        self.label.text = [NSString stringWithFormat:@"Gravity\nX: %.2d\nY: %.2d\nZ: %.2d", x, y, z];
}

@end
