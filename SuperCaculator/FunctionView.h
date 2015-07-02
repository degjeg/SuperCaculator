//
//  FunctionView.h
//  SuperCaculator
//
//  Created by danger on 15/7/2.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Function.h"
@interface FunctionView : UIView

@property(nonatomic, retain) Function* function;
@property(nonatomic, assign) CGPoint origin;//原点的坐标

@end
