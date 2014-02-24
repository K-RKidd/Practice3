//
//  SpirographView.m
//  Spirograph
//
//  Created by Krystle on 2/23/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "SpirographView.h"
#import "SpirographViewController.h"

@implementation SpirographView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect{
    
    CGFloat x,y;
    CGFloat t = 0.0;
    CGFloat R = 120;
    CGFloat l = 0.01;
    CGFloat k = 0.99;
    
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    x = R *((1-k) * cos(t) + l*k * cos(1-k/k) *t);
    y = R *((1-k) * sin(t) - l*k  * sin(1-k/k)*t);
    CGPoint p = CGPointMake(x, y);
    [bz moveToPoint:p];
    
    for (t=0; self.numberOfSteps; t= t+ self.stepSize){
        
        x = R *((1-k) * cos(t) + l*k * cos(1-k/k) *t);
        y = R *((1-k) * sin(t) - l*k  * sin(1-k/k)*t);
        p= CGPointMake(x, y);
        [bz addLineToPoint:p];
        
    }
    [bz stroke];
    
}

@end
