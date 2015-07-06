//
//  FunctionView.m
//  SuperCaculator
//
//  Created by danger on 15/7/2.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "FunctionView.h"
#import "CommonDef.h"

@interface FunctionView ()
@property(nonatomic, assign) CGPoint downPoint;//
@property(nonatomic, assign) float xZoom;//
@property(nonatomic, assign) float yZoom;//
@end

@implementation FunctionView

-(void) didMoveToSuperview {
    self.origin = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    self.xZoom = 0.01f;
    self.yZoom = 0.01f;
    
    NSLog(@"bounds:%f,%f-(%f x %f)", self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
    NSLog(@"frame:%f,%f-(%f x %f)", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);

    NSLog(@"screen:(%f x %f)", SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    ///画最外面的边框
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0xab/255.0f green:0xcd/255.0f blue:0xef/255.0f alpha:1].CGColor);
    CGContextStrokeRect(ctx, self.bounds);
    
    ///填充背景色
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0xee/255.0f green:0xee/255.0f blue:0xee/255.0f alpha:1].CGColor);
    CGContextFillRect(ctx, CGRectInset(self.bounds, 1, 1));
    
    
//    CGMutablePathRef path = CGPathCreateMutable();
//    
//    CGPathMoveToPoint(path, nil, 0, self.bounds.origin.y + self.bounds.size.height - 113);
//    CGPathAddLineToPoint(path, nil, self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y + self.bounds.size.height - 113);
//    
//    [[UIColor redColor] setStroke];
//    CGContextSetLineWidth(ctx, 1);
//    CGContextAddPath(ctx, path);
//    CGContextDrawPath(ctx, kCGPathStroke);
   
    
    [self drawFunction:self.function];
}


-(void) drawFunction:(Function*)fun {
    [self drawXAxis];
    [self drawYAxis];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    BOOL lineStarted = NO;
    
    for(int i = self.bounds.origin.x; i < self.bounds.origin.x + self.bounds.size.width; i++) {
        LDouble realX = 1.0f * (i - self.origin.x);
        Number* value = [[self function]getValue:realX];
        
        if(value && value.valid) {//数字有效
            LDouble y = self.origin.y - value.number;
            
            if(y < CGRectGetMinY(self.bounds)) {
                y = CGRectGetMinY(self.bounds) - 1;
            } else if(y > CGRectGetMaxY(self.bounds)) {
                y = CGRectGetMaxY(self.bounds) + 1;
            }
            NSLog(@"%LF->%LF->%Lf", realX, value.number, y);
            if(lineStarted) {
                CGContextAddLineToPoint(ctx, i, y);
            } else {
                CGContextMoveToPoint(ctx, i, y);
            }
            
            lineStarted = YES;
        } else {
            lineStarted = NO;
        }
    }
    
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(ctx, 1);
    CGContextAddPath(ctx, path);
    
    CGContextDrawPath(ctx, kCGPathStroke);
}

-(void) drawXAxis {
    
    if(self.origin.y < CGRectGetMinY(self.bounds) && self.origin.y > CGRectGetMaxY(self.bounds) ) {
        return;
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, nil, 0, self.origin.y);
    CGPathAddLineToPoint(path, nil, self.bounds.origin.x + self.bounds.size.width, self.origin.y);
    
    [[UIColor greenColor] setStroke];
    CGContextSetLineWidth(ctx, 1);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    double x = self.origin.x + 100;
    for(; x < CGRectGetMaxX(self.bounds); x += 100) {
        if(x < CGRectGetMinX(self.bounds)) {
            continue;
        }
        
        [self drawLabel:CGPointMake(x, self.origin.y) label:(x * self.xZoom)];
    }
    
    for(x = self.origin.x - 100; x > CGRectGetMinX(self.bounds); x -= 100) {
        if(x > CGRectGetMaxX(self.bounds)) {
            continue;
        }
        
        [self drawLabel:CGPointMake(x, self.origin.y) label:(x * self.xZoom)];
               
    }

    
}

-(void) drawYAxis {
    
    if(self.origin.x < CGRectGetMinX(self.bounds) && self.origin.y > CGRectGetMaxX(self.bounds) ) {
        return;
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, nil,  self.origin.x, self.bounds.origin.y);
    CGPathAddLineToPoint(path, nil, self.origin.x , self.bounds.origin.y+self.bounds.size.height);
    
    [[UIColor greenColor] setStroke];
    CGContextSetLineWidth(ctx, 1);

    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathStroke);
}


-(void) drawLabel:(CGPoint)pt label:(double) label {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(pt.x, pt.y - 2, 1, 2));
}


#pragma TouchEvents
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(touches.count == 1) {
        UITouch* touch = [event.allTouches.allObjects objectAtIndex:0];
        self.downPoint = [touch locationInView:self];
    }
}


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(touches.count == 1) {
        UITouch* touch = [event.allTouches.allObjects objectAtIndex:0];
        CGPoint loc = [touch locationInView:self];
        
        self.origin = CGPointMake(self.origin.x + loc.x - self.downPoint.x,
                                  self.origin.y + loc.y - self.downPoint.y);
        self.downPoint = loc;
        [self setNeedsDisplay];
    }

}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}




@end
