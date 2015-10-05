//
//  KLHypnosisView.m
//  Hypnosister
//
//  Created by Kevin on 15/9/24.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLHypnosisView.h"

@interface KLHypnosisView ()
@property (nonatomic, strong) UIColor *circleColor;;

@end

@implementation KLHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    // Bronze & Gold Challenge
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    // CGRect logoRect for logo image frame
    CGRect logoRect;
    logoRect.origin.x = bounds.origin.x + bounds.size.width / 4.0;
    logoRect.origin.y = bounds.origin.y + bounds.size.height / 4.0;
    logoRect.size.width = bounds.size.width / 2.0;
    logoRect.size.height = bounds.size.height / 2.0;
    
    // getting currentContext
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // save currentContext
    CGContextSaveGState(currentContext);
    
    // Allocate and initiate myPath, the instance of UIBerzierPath class, to use for the path of clipping area.
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    
    // make clipping area as triangle by adding some line to myPath.
    [myPath moveToPoint:CGPointMake(bounds.origin.x + bounds.size.width / 2.0, bounds.origin.y + bounds.size.height / 6.0)];
    [myPath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width / 6.0, bounds.origin.y + bounds.size.height / 6.0 * 5.0)];
    [myPath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width / 6.0 * 5, bounds.origin.y + bounds.size.height / 6.0 * 5.0)];
    
    // intersect mypath and current graphic context and make resulting shape the current clipping path.
    [myPath addClip];
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.0, 1.0, 0.0, 1.0,   // Starting color is green
        1.0, 1.0, 0.0, 1.0 }; // Ending color is yellow
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    // startpoint for gradient
    CGPoint startPoint = CGPointMake(bounds.origin.x + bounds.size.width / 2.0, bounds.origin.y + bounds.size.height / 6.0);
    // endpoint for gradient
    CGPoint endPoint = CGPointMake(bounds.origin.x + bounds.size.width / 2.0, bounds.origin.y + bounds.size.height / 6.0 * 5);
    // do the gradient
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    // deallocating memory??
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    // restore currentContext
    CGContextRestoreGState(currentContext);
    
    // logo image with shadow
    CGContextSetShadow(currentContext, CGSizeMake(4,7), 3);
    // logoimage drawing in the frame of logoRect
    [logoImage drawInRect:logoRect];
    
}


@end
