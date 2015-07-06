//
//  Operator_n.m
//  SuperCaculator
//
//  Created by danger on 15/7/6.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "Operator_Avg.h"
#import "Operator_Mid2.h"
//算术平均数
//(x1+x2...)/n
@implementation Operator_Avg
-(CaculateResult)caculate1:(Number *)n1 {
    int n = n1.exData ? (int)n1.exData.count + 1 : 1;
    LDouble total = n1.number;
    if(n1.exData) {
        for(Number* num in n1.exData) {
            total += num.number;
        }
    }
    
    CaculateResult result = { 0 };
    result.number = total / n;
    
    return result;
}
@end

//几何平均数
//pow(x1*x2*x3..., 1/n)
@implementation Operator_AvgG
-(CaculateResult)caculate1:(Number *)n1 {
    int n = n1.exData ? (int)n1.exData.count + 1 : 1;
    LDouble total = n1.number;
    if(n1.exData) {
        for(Number* num in n1.exData) {
            total *= num.number;
        }
    }
    
    CaculateResult result = { 0 };
    result.number = total / n;
    
    Operator_Pow *pow = [[Operator_Pow alloc]init];
    
    return [pow caculate2:[[Number alloc]initWithNumber:total] n2:[[Number alloc]initWithNumber:n]];
}

@end

//调和平均数
//n/(1/x1+1/x2...)
@implementation Operator_AvgH

-(CaculateResult)caculate1:(Number *)n1 {
    int n = n1.exData ? (int)n1.exData.count + 1 : 1;
    CaculateResult r;
    
    if(n1.number == 0) {
        r.retcode = CACULAT_DIVIDE_ZERO;
        return r;
    }
    
    LDouble total = 1 / n1.number;
    
    if(n1.exData) {
        for(Number* num in n1.exData) {
            if(num.number == 0) {
                r.retcode = CACULAT_DIVIDE_ZERO;
                return r;
            }
            total *= 1 / num.number;
        }
    }
    
    if(total == 0) {
        CaculateResult r;
        r.retcode = CACULAT_DIVIDE_ZERO;
        return r;
    }

    r.number = n / total;
    return  r;
}



@end

//平方平均数
//sqrt((x1^2+x2^2+...)/n)
@implementation Operator_AvgM

-(CaculateResult)caculate1:(Number *)n1 {
    int n = n1.exData ? (int)n1.exData.count + 1 : 1;
    CaculateResult r;
    
    LDouble total = n1.number * n1.number;
    
    if(n1.exData) {
        for(Number* num in n1.exData) {
            total *= num.number * num.number;
        }
    }
    
    r.number = sqrtl(total / n);
    return  r;
}
@end
