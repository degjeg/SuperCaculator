//
//  Operator_End1.m
//  GlossButton
//
//  Created by danger on 15/6/29.
//
//

#import "Operator_End1.h"

@implementation Operator_Fac

-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };

    if(n1 < 0) {
        result.retcode = CACULAT_FAC_MINUS;
        return result;
    }
    
    n1 = (long long)n1;
    if(n1 == 0) {//如果结果为0，直接返回
        return result;
    }
    
    
    LDouble fac = 1;
    LDouble step = 1;
    
    while(step <= n1) {
        fac *= step;
        step++;
    }
    
    result.number = fac;
    return result;
}

@end
