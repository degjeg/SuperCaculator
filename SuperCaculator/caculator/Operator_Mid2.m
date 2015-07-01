//
//  Operator_Add.m
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import "Operator_Mid2.h"



@implementation Operator_Mid2 : Operator

-(CaculateResult) caculateReal:(LDouble*)parameters {
    LDouble number1 = parameters[0];
    LDouble number2 = parameters[1];

    return [self caculate:number1 n2:number2];
}

-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2 {
    CaculateResult result = { 0 };;
    return result;
}

@end


@implementation Operator_Add

-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2  {
    CaculateResult result = { 0 };;
    result.number = n1 + n2;
    
    return result;
}
@end



@implementation Operator_Sub
-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2 {
    CaculateResult result = { 0 };;
    result.number = n1 - n2;
    
    return result;
}
@end

@implementation Operator_Mul
-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2 {
    CaculateResult result = { 0 };
    result.number = n1 * n2;
    
    return result;
}
@end

@implementation Operator_Div

-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2  {
    
    CaculateResult result = { 0 };
    
    if(n2 == 0) {
        result.retcode = CACULAT_DIVIDE_ZERO;
        return result;
    }
    result.number = n1 / n2;
    
    return result;
}
@end

@implementation Operator_Pow

-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble) n2  {
    
    CaculateResult result = { 0 };
    
    result.number = powl(n1, n2);
    
    return result;
}

@end

