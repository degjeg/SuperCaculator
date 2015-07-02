//
//  ViewController.m
//  SuperCaculator
//
//  Created by danger on 15/7/1.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "FunctionGraphViewController.h"
#import "CommonDef.h"

@interface FunctionGraphViewController ()

@end

@implementation FunctionGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    int y = [[UIScreen mainScreen] applicationFrame].origin.y;
    
    UIButton* backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, y, SCREEN_WIDTH, 40)];
    backButton.backgroundColor = [UIColor colorWithRed:0xab/255.0f green:0xcd/255.0f blue:0xef/255.0f alpha:1];
    [backButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    backButton.titleLabel.textColor=[UIColor redColor];//设置文字颜色
    
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//设置文字位置，现设为居左，默认的是居中
    backButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//设置文字位置，现设为居左，默认的是居中
    
    NSString* titleString = [NSString stringWithFormat:@"  返回: f(x)=%@", self.function.function];
    [backButton setTitle:titleString forState:UIControlStateNormal];// 添加文字
    [self.view addSubview:backButton];
    
    self.funView = [[FunctionView alloc] initWithFrame:CGRectMake(40, y + 40, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 80)];
    self.funView.function = self.function;
    [self.view addSubview:self.funView];
    /// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)buttonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){
                NSLog(@"done...");
            }];


}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
//- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self dismissViewControllerAnimated:YES completion:^(void){
//        NSLog(@"done...");
//    }];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches Began");
//    [self logTouches: event];
    
    [super touchesEnded: touches withEvent: event];
}

@end
