//
//  ViewController.h
//  SuperCaculator
//
//  Created by danger on 15/7/1.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
#import "FunctionView.h"



@interface FunctionGraphViewController : UIViewController

@property(nonatomic, retain) Function* function;
@property(nonatomic, retain) FunctionView* funView;

-(void)buttonTapped:(id)sender;
@end

