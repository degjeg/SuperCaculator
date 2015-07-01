//
//  Operator_Pre1.m
//  GlossButton
//
//  Created by danger on 15/6/27.
//
//

#import "Operator_Pre1.h"



@implementation Operator_Pre1
-(CaculateResult) caculateReal:(LDouble*)parameters {
    LDouble number1 = parameters[0];
    
    return [self caculate:number1];
}

-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    return result;
}

@end

@implementation Operator_Sin
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1];
    
    result.number = sinl(radian);
    return result;
}
@end

@implementation Operator_Cos
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1];
    
    result.number = cosl(radian);
    return result;
}
@end

@implementation Operator_Tan
-(CaculateResult)caculate:(LDouble) n1  {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1];
    
    LDouble sinValue = sinl(radian);
    LDouble cosValue = cosl(radian);
    
    if(cosValue == 0) {
        result.retcode = CACULAT_TAN_90;
        return result;
    }
    
    result.number = sinValue / cosValue;
    return result;
}
@end

@implementation Operator_Cot
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1];
    
    LDouble sinValue = sinl(radian);
    LDouble cosValue = cosl(radian);
    
    if(sinValue == 0) {
        result.retcode = CACULAT_COT_0;
        return result;
    }
    
    result.number = cosValue / sinValue;
    return result;
}
@end


@implementation Operator_ASin
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = asinl(n1);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ACos
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = acosl(n1);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ATan
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = atanl(n1);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ACot
-(CaculateResult)caculate:(LDouble) n1 {
    CaculateResult result = { 0 };
    LDouble radian = 0;//[self toRadian:n1];
    if(n1 != 0) {
        radian = atanl(1 / n1);
    }
    
    result.number = [self toAngle:radian];
    return result;
}
@end