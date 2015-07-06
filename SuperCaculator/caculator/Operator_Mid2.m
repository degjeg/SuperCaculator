//
//  Operator_Add.m
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import "Operator_Mid2.h"


@implementation Operator_Add

-(CaculateResult)caculate2:(Number*)n1 n2:(Number*) n2  {
    CaculateResult result = { 0 };;
    result.number = n1.number + n2.number;
    
    return result;
}
@end



@implementation Operator_Sub
-(CaculateResult)caculate2:(Number*)n1 n2:(Number*) n2 {
    CaculateResult result = { 0 };;
    result.number = n1.number - n2.number;
    
    return result;
}
@end

@implementation Operator_Mul
-(CaculateResult)caculate2:(Number*)n1 n2:(Number*) n2 {
    CaculateResult result = { 0 };
    result.number = n1.number * n2.number;
    
    return result;
}
@end

@implementation Operator_Div

-(CaculateResult)caculate2:(Number*)n1 n2:(Number*) n2  {
    
    CaculateResult result = { 0 };
    
    if(n2.number == 0) {
        result.retcode = CACULAT_DIVIDE_ZERO;
        return result;
    }
    result.number = n1.number / n2.number;
    
    return result;
}
@end

@implementation Operator_Pow

-(CaculateResult)caculate2:(Number*)n1 n2:(Number*) n2  {
    
    CaculateResult result = { 0 };
    
    result.number = powl(n1.number, n2.number);
    
    return result;
}

@end

