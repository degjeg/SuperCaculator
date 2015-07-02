//
//  Operator.m
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import "Operator.h"

@implementation Operator

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithType:(OperatorType)type name:(NSString*)names pc:(int)parameterCount pro:(int)pro{
    if(self = [super init]) {
        self.type = type;
        
        self.names = [[NSMutableArray alloc]initWithArray:[names componentsSeparatedByString:@" "]];
        self.parameterCount = parameterCount;
        self.privority = pro;
        
        self.unit = UNIT_Radian;
        
    }
    
    return self;
}

-(BOOL)matchString:(NSString*)str {
    for(NSString* str1 in self.names) {
        if( [str1 compare:str] == NSOrderedSame) {
            return YES;
        }
    }
    

    return NO;
}

-(CaculateResult) caculate:(LDouble)number,... { //first number is return value
    //指向变参的指针
    long double returnNumber = 0.0;
    LDouble parameters[10];
    
    va_list list;
    //使用第一个参数来初使化list指针
    va_start(list, number);
    
    int index = 0;
    while (YES) {
        //返回可变参数，va_arg第二个参数为可变参数类型，如果有多个可变参数，依次调用可获取各个参数
        LDouble oneNumber = va_arg(list, LDouble);
        if (!oneNumber) {
            break;
        }
        
        if(!returnNumber) {
            returnNumber = oneNumber;
        } else {
            parameters[index++] = oneNumber;
        }
//        NSLog(@"%@",string);
    }
    //结束可变参数的获取
    va_end(list);
    
    return [self caculateReal:parameters];

}

-(CaculateResult) caculateReal:(LDouble*)parameters {
    
    NSLog(@"must be overrite by subclass!");
    CaculateResult result;
    return result;

}


-(LDouble) toRadian:(LDouble)number {
    if(self.unit == UNIT_ANGLE) {
        return number * M_PI / 180;
    }

    return number;
}

-(LDouble) toAngle:(LDouble)number {
    if(self.unit == UNIT_ANGLE) {//是弧度
        return number * 180 / M_PI;
    }

    return number;
}

@end
