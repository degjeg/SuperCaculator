//
//  Function.m
//  SuperCaculator
//
//  Created by danger on 15/7/1.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "Function.h"
#import "Caculator.h"
#import "OperatorX.h"

#define MAX_VALUES 10000

@implementation Function

- (instancetype)init {
    self = [super init];
    if (self) {
        self.datas = [[NSMutableDictionary alloc]init];
        self.xs = [[NSMutableArray alloc]init];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(Number*) getValue:(LDouble)x {
    Number* xKey = [[Number alloc]initWithNumber:x];
    Number* value = [self.datas objectForKey:xKey];
    if(value) {
        return value;
    }

    Caculator* caculator = [[Caculator alloc]init];
    caculator.expression = [NSString stringWithString:self.function];
    
    OperatorX *operatorx = [[OperatorX alloc] initWithType:OPERATOR_PRE name:@"x" pc:0 pro:OPERATOR_PRIVORITY_MAX];
    operatorx.value = x;
    [caculator.sos addObject:operatorx];
    
    CaculateResult r = [caculator evaulateExpression:caculator.expression];
    if(r.retcode == CACULAT_OK) {
        value = [[Number alloc]initWithNumber:r.number];
    } else {
        value = [[Number alloc]initWithNumber:r.number];
        value.valid = NO;
    }
    
    [self.datas setObject:value forKey:xKey];
    [self.xs addObject:xKey];
    
    if(self.xs.count > MAX_VALUES) {
        [self.datas removeObjectForKey:[self.xs objectAtIndex:0]];
        [self.xs removeObjectAtIndex:0];
    }
    return value;
}

@end
