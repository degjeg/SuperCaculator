//
//  GlossButtonViewController.m
//  GlossButton
//
//  Created by Chris Jones on 10/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GlossButtonViewController.h"

#import "CustomView.h"
#import "Caculator.h"
#import "Operator.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define PI 3.1415926

@implementation GlossButtonViewController

@synthesize	button1=_button1;
@synthesize	button2=_button2;
@synthesize	button3=_button3;
@synthesize	button4=_button4;
@synthesize	button5=_button5;
@synthesize	button6=_button6;
@synthesize	button7=_button7;
@synthesize	button8=_button8;
@synthesize	button9=_button9;
@synthesize	button0=_button0;
@synthesize	buttonPoint=_buttonPoint;

@synthesize	buttonPlus=_buttonPlus;
@synthesize	buttonMinus=_buttonMinus;
@synthesize	buttonDivide=_buttonDivide;
@synthesize	buttonMultiply=_buttonMultiply;
@synthesize	buttonEquals=_buttonEquals;
@synthesize	buttonClear=_buttonClear;
@synthesize	buttonPlusminus=_buttonPlusminus;

@synthesize buttons=_buttons;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    CustomView* customView = [[CustomView alloc] init];
    //    customView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT);
    //    customView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    //    [self.view addSubview:customView];
    
    NSCharacterSet* set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSString *str=@"  d\nd\ta\ra\ra, s   \n";
    NSString *str1 = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str1 = [str1 stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    str1 = [str1 stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str1 = [str1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    
    
    NSLog(@"%@, str=%@, str1=%@", set, str, str1);
    
    NSLog(@"sizeof(int)=%lu", sizeof(int));
    NSLog(@"sizeof(double)=%lu", sizeof(double));
    NSLog(@"sizeof(LDouble)=%lu", sizeof(LDouble));
    NSLog(@"sizeof(float)=%lu", sizeof(float));
    NSLog(@"sizeof(long float)=%lu", sizeof(long long));
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    CGFloat height=50;
    CGFloat width=80;
    CGFloat col1=0;
    CGFloat row1=245;
    CGFloat row0=190;
    
    CGFloat spacingy=3;
    CGFloat row2=row1+height+spacingy;
    CGFloat row3=row2+height+spacingy;
    CGFloat row4=row3+height+spacingy;
    CGFloat spacingx=0;
    CGFloat col2=col1+width+spacingx;
    CGFloat col3=col2+width+spacingx;
    CGFloat col4=col3+width+spacingx;
    
    
    self.button7 = [[CustomButton alloc] initWithText:@"7" target:self selector:@selector(buttonTapped:)];
    _button7.frame = CGRectMake(col1,row1, width, height);
    self.button8 = [[CustomButton alloc] initWithText:@"8" target:self selector:@selector(buttonTapped:)];
    _button8.frame = CGRectMake(col2,row1, width, height);
    self.button9 = [[CustomButton alloc] initWithText:@"9" target:self selector:@selector(buttonTapped:)];
    _button9.frame = CGRectMake(col3,row1, width, height);
    self.button4 = [[CustomButton alloc] initWithText:@"4" target:self selector:@selector(buttonTapped:)];
    _button4.frame = CGRectMake(col1,row2, width, height);
    self.button5 = [[CustomButton alloc] initWithText:@"5" target:self selector:@selector(buttonTapped:)];
    _button5.frame = CGRectMake(col2,row2, width, height);
    self.button6 = [[CustomButton alloc] initWithText:@"6" target:self selector:@selector(buttonTapped:)];
    _button6.frame = CGRectMake(col3,row2, width, height);
    self.button1 = [[CustomButton alloc] initWithText:@"1" target:self selector:@selector(buttonTapped:)];
    _button1.frame = CGRectMake(col1,row3, width, height);
    self.button2 = [[CustomButton alloc] initWithText:@"2" target:self selector:@selector(buttonTapped:)];
    _button2.frame = CGRectMake(col2,row3, width, height);
    self.button3 = [[CustomButton alloc] initWithText:@"3" target:self selector:@selector(buttonTapped:)];
    _button3.frame = CGRectMake(col3,row3, width, height);
    self.button0 = [[CustomButton alloc] initWithText:@"0" target:self selector:@selector(buttonTapped:)];
    _button0.frame = CGRectMake(col1,row4, width*2, height);
    self.buttonPoint = [[CustomButton alloc] initWithText:@"." target:self selector:@selector(buttonTapped:)];
    _buttonPoint.frame = CGRectMake(col3,row4, width, height);
    
    self.buttonEquals = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.0f saturation:0.01f brightness:1.0f];
    _buttonEquals.frame = CGRectMake(col4,row3, width, height*2);
    
    self.buttonPlus = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonPlus.frame = CGRectMake(col4,row2, width, height);
    self.buttonMinus = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonMinus.frame = CGRectMake(col4,row1, width, height);
    self.buttonMultiply = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonMultiply.frame = CGRectMake(col4,row0, width, height);
    
    self.buttonDivide = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonDivide.frame = CGRectMake(col3,row0, width, height);
    self.buttonPlusminus = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonPlusminus.frame = CGRectMake(col2,row0, width, height);
    self.buttonClear = [[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f];
    _buttonClear.frame = CGRectMake(col1,row0, width, height);
    
    [self.buttonClear setLabelWithText:@"AC" andSize:18.0f andVerticalShift:-2.0f];
    [self.buttonMinus setLabelWithText:@"−" andSize:24.0f andVerticalShift:-2.0f];
    [self.buttonMultiply setLabelWithText:@"×" andSize:24.0f andVerticalShift:-2.0f];
    [self.buttonPlus setLabelWithText:@"+" andSize:24.0f andVerticalShift:-2.0f];
    [self.buttonDivide setLabelWithText:@"÷" andSize:24.0f andVerticalShift:-2.0f];
    [self.buttonPlusminus setLabelWithText:@"±" andSize:24.0f andVerticalShift:-2.0f];
    
    [self.buttonEquals setLabelWithText:@"=" andSize:24.0f andVerticalShift:22.0f];
    
    //	_buttonPlus.toggled=YES;
    
    self.buttons = [NSMutableArray arrayWithObjects:
                    _button1,
                    _button2,
                    _button3,
                    _button4,
                    _button5,
                    _button6,
                    _button7,
                    _button8,
                    _button9,
                    _button0,
                    _buttonPoint,
                    _buttonPlus,
                    _buttonEquals,
                    _buttonMinus,
                    _buttonMultiply,
                    _buttonClear,
                    _buttonPlusminus,
                    _buttonDivide,
                    
                    
                    nil];
    
    for (CustomButton *button in _buttons) {
        [self.view addSubview:button];
    }
    
    self.expression = [[UITextView alloc]init];
    self.expression.frame = CGRectMake(10, 20, SCREEN_WIDTH-20, 100);
    self.expression.backgroundColor = [UIColor colorWithRed:0.8 green:0.4 blue:0.9 alpha:1.0];
    //    self.expression.borderStyle = UITextBorderStyleRoundedRect;
    self.expression.textAlignment = NSTextAlignmentRight;
    
    //设置输入框内容的字体样式和大小
    self.expression.font = [UIFont fontWithName:@"Arial" size:20.0f];
    
    self.expression.keyboardType = UIKeyboardTypeASCIICapable;
    //设置字体颜色
    self.expression.textColor = [UIColor blackColor];
    
    //    self.expression.text = @"9-(3*(4-2*(2-4)))";
//    self.expression.text = @"sin45";
        self.expression.text = @"0-2^-5+6*sin(30)";
    [self.expression addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    
    [self.view addSubview:self.expression];
    //    [formulaTextField first];
    
    self.tvResult = [[UITextView alloc]init];
    self.tvResult.frame = CGRectMake(10, 120, SCREEN_WIDTH-20, 40);
    self.tvResult.backgroundColor = [UIColor colorWithRed:0.8 green:0.4 blue:0.9 alpha:0];
    self.tvResult.textAlignment = NSTextAlignmentRight;
    self.tvResult.font = [UIFont fontWithName:@"Arial" size:20.0f];
    self.tvResult.keyboardType = UIKeyboardTypeASCIICapable;
    self.tvResult.textColor = [UIColor blackColor];
    self.tvResult.text = @"0";
    [self.view addSubview:self.tvResult];
    
}

-(void)drawInBitmap {
    //创建CGContextRef
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    
    
    //=== 绘画逻辑 ===
    
    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGContextSaveGState(gc);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
    
    //创建CGMutablePathRef
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    //半径为30
    
    CGFloat radius = 15;
    
    //初始点为(0, 0)
    
    CGPathMoveToPoint(path, &transform, 0, 0);
    
    //右上角和右下角两个点，画出半个圆角
    
    CGPathAddArcToPoint(path, &transform, 230, 0, 230, 230, radius);
    
    //右下角和左下角两个点，画出另外半个圆角
    
    CGPathAddArcToPoint(path, &transform, 230, 230, 0, 230, radius);
    
    //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
    
    CGPathAddLineToPoint(path, &transform, 0, 230);
    
    
    //将CGMutablePathRef添加到当前Context内
    
    CGContextAddPath(gc, path);
    
    [[UIColor grayColor] setFill];
    
    [[UIColor blueColor] setStroke];
    
    CGContextSetLineWidth(gc, 20);
    
    //执行绘画
    
    CGContextDrawPath(gc, kCGPathFillStroke);
    //    CGContextRestoreGState(gc);
    
    //画弧形
    CGMutablePathRef pathArc = CGPathCreateMutable();
    CGPathAddArc(pathArc, &transform, 100, 100, 40, PI*0/180, PI*270/180, NO);
    CGContextAddPath(gc, pathArc);
    //    [[UIColor blackColor] setFill];
    //
    //    [[UIColor yellowColor] setStroke];
    
    CGContextDrawPath(gc, kCGPathFillStroke);
    
    //从Context中获取图像，并显示在界面上
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    
    [self.view addSubview:imgView];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *tv = object;
    //Center vertical alignment
    //CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    //topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    //tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
    //Bottom vertical alignment
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height);
    topCorrect = (topCorrect <0.0 ? 0.0 : topCorrect);
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}

-(void)buttonTapped:(id)sender {
    [self.expression resignFirstResponder];
    if(sender == self.button0) {
        self.expression.text = [self.expression.text stringByAppendingString:@"0"];
    } else if(sender == self.button1) {
        self.expression.text = [self.expression.text stringByAppendingString:@"1"];
    } else if(sender == self.button2) {
        self.expression.text = [self.expression.text stringByAppendingString:@"2"];
    } else if(sender == self.button3) {
        self.expression.text = [self.expression.text stringByAppendingString:@"3"];
    } else if(sender == self.button4) {
        self.expression.text = [self.expression.text stringByAppendingString:@"4"];
    } else if(sender == self.button5) {
        self.expression.text = [self.expression.text stringByAppendingString:@"5"];
    } else if(sender == self.button6) {
        self.expression.text = [self.expression.text stringByAppendingString:@"6"];
    } else if(sender == self.button7) {
        self.expression.text = [self.expression.text stringByAppendingString:@"7"];
    } else if(sender == self.button8) {
        self.expression.text = [self.expression.text stringByAppendingString:@"8"];
    } else if(sender == self.button9) {
        self.expression.text = [self.expression.text stringByAppendingString:@"9"];
    }
    
    if(sender == self.buttonPoint) {
        self.expression.text = [self.expression.text stringByAppendingString:@"."];
    } else if(sender == self.buttonPlus) {
        self.expression.text = [self.expression.text stringByAppendingString:@"+"];
    } else if(sender == self.buttonMinus) {
        self.expression.text = [self.expression.text stringByAppendingString:@"-"];
    } else if(sender == self.buttonDivide) {
        self.expression.text = [self.expression.text stringByAppendingString:@"/"];
    } else if(sender == self.buttonMultiply) {
        self.expression.text = [self.expression.text stringByAppendingString:@"*"];
    } else if(sender == self.buttonClear) {
        self.expression.text = @"";
    }
    
    if(sender == self.buttonEquals) {
        Caculator *caculator = [[Caculator alloc]init];
        
        CaculateResult result = [caculator evaulateExpression:self.expression.text];
        
        
        //        10000000000
        if(result.retcode == CACULAT_OK) {
//            char tmp[10240] = {0};
//            
//            if(result.number > 1000000000000000  || (long long)result.number != result.number) {
//                sprintf(tmp, "%.14LE", result.number);
//                
//            } else {
//                sprintf(tmp, "%.15Lf", result.number);
//                
//            }
//            if(strstr(tmp, ".")) {
//                int len = strlen(tmp);
//                int i =  len - 1;
//
//                char* ptrE;
//                if(NULL != (ptrE = strstr(tmp, "e"))) {
//                    i = ptrE - tmp;
//                } else if(NULL != (ptrE = strstr(tmp, "E"))) {
//                    i = ptrE - tmp;
//                }
//                
//                for(; i > 0; i--) {
//                    
//                    if(tmp[i] == 'e' || tmp[i] == 'E') {
//                        continue;
//                    } else if(tmp[i] == '0' || tmp[i] == '.' ) {
//                        int shouldBreak = tmp[i] == '.';
//                        int j = i;
//                        for(; j < len; j++) {
//                            tmp[j] = tmp[j + 1];
//                        }
//                        tmp[j] = 0;
//                        if(shouldBreak) {
//                            break;
//                        }
//                    } else {
//                        break;
//                    }
//                }
//            }
            NSLog(@"result=%Lf", result.number);
            self.tvResult.text = [NSString stringWithFormat:@"=%Lf", result.number];
        } else {
            NSLog(@"计算失败=%d", result.retcode);
            self.tvResult.text = [NSString stringWithFormat:@"Err:%d", result.retcode];
        }
    }
    NSLog(@"button tap");
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.expression resignFirstResponder];
}



@end
