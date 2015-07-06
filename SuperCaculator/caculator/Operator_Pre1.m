//
//  Operator_Pre1.m
//  GlossButton
//
//  Created by danger on 15/6/27.
//
//

#import "Operator_Pre1.h"


@implementation Operator_Sin
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1.number];
    
    result.number = sinl(radian);
    return result;
}
@end

@implementation Operator_Cos
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1.number];
    
    result.number = cosl(radian);
    return result;
}
@end

@implementation Operator_Tan
-(CaculateResult)caculate1:(Number*) n1  {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1.number];
    
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
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = [self toRadian:n1.number];
    
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
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = asinl(n1.number);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ACos
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = acosl(n1.number);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ATan
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = atanl(n1.number);
    
    result.number = [self toAngle:radian];
    return result;
}
@end

@implementation Operator_ACot
-(CaculateResult)caculate1:(Number*) n1 {
    CaculateResult result = { 0 };
    LDouble radian = 0;//[self toRadian:n1];
    if(n1.number != 0) {
        radian = atanl(1 / n1.number);
    }
    
    result.number = [self toAngle:radian];
    return result;
}
@end