//
//  OperatorX.m
//  SuperCaculator
//
//  Created by danger on 15/7/1.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "OperatorX.h"

@implementation OperatorX

-(CaculateResult) caculate:(NSArray*)number {
    CaculateResult result = { 0 };
    result.retcode = CACULAT_OK;
    result.number = self.value;
    
    return result;
}

@end
