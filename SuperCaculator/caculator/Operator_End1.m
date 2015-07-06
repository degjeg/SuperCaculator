//
//  Operator_End1.m
//  GlossButton
//
//  Created by danger on 15/6/29.
//
//

#import "Operator_End1.h"

@implementation Operator_Fac

-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };

    if(n1 < 0) {
        result.retcode = CACULAT_FAC_MINUS;
        return result;
    }
    
    long long n = n1.number;
    if(n1 == 0) {//如果结果为0，直接返回
        return result;
    }
    
    
    LDouble fac = 1;
    LDouble step = 1;
    
    while(step <= n) {
        fac *= step;
        step++;
    }
    
    result.number = fac;
    return result;
}

@end
