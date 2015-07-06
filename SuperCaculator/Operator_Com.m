//
//  Operator_Com.m
//  SuperCaculator
//
//  Created by danger on 15/7/6.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "Operator_Com.h"
#import "Operator_Mid2.h"

//计算最小
@implementation  Operator_Min
-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    
    r.number = n1.number;
    
    if(n1.exData) {
        for(Number* num in n1.exData) {
            if(num.number < r.number) {
                r.number = num.number;
            }
        }
    }
    
    return r;
}

@end

//计算最大
@implementation Operator_Max
-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    
    r.number = n1.number;
    
    if(n1.exData) {
        for(Number* num in n1.exData) {
            if(num.number > r.number) {
                r.number = num.number;
            }
        }
    }
    
    return r;
}

@end

//计算绝对值
@implementation Operator_Abs

-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    
    if(n1.number < 0) {
        r.number = -n1.number;
    } else {
        r.number = n1.number;
    }
    
    return r;
}

@end


//最大公约数,仅计算整数
@implementation Operator_Gcd

-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    
    r.number = n1.number;
    if(!n1.exData || n1.exData.count < 1) {
        return r;
    }
    
    for(Number* num in n1.exData) {
        CaculateResult rTmp = [self gcd2:[[Number alloc]initWithNumber:r.number] n2:num];
        if(rTmp.retcode != CACULAT_OK) {
            return rTmp;
        }
        r.number = rTmp.number;
    }
    
    return r;
}

//2个数的最大公约数,仅计算整数
-(CaculateResult) gcd2:(Number*)n1 n2:(Number*)n2 {
    long long N1 = MAX(n1.number, n2.number);
    long long N2 = MIN(n1.number, n2.number);

    CaculateResult r = { 0 };
    if(N1 == 0 || N2 == 0) {
        r.number = N1;
        return r;
    }
    while(N1 % N2 != 0) {
        long long tmp = N2;
        N2 = N1 % N2;
        N1 = tmp;
    }

    r.number = N2;
    return r;
}

@end

//最小公倍数
@implementation Operator_Lcm

-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    
    r.number = n1.number;
    if(!n1.exData || n1.exData.count < 1) {
        return r;
    }
    
    for(Number* num in n1.exData) {
        CaculateResult rTmp = [self lcm2:[[Number alloc]initWithNumber:r.number] n2:num];
        if(rTmp.retcode != CACULAT_OK) {
            return rTmp;
        }
        r.number = rTmp.number;
    }
    
    return r;
}

//2个数的最小公倍数,仅计算整数
-(CaculateResult) lcm2:(Number*)n1 n2:(Number*)n2 {
    long long N1 = MAX(n1.number, n2.number);
    long long N2 = MIN(n1.number, n2.number);
    
    Operator_Gcd *operator_Gcd = [[Operator_Gcd alloc]init];
    CaculateResult r = { 0 };
    CaculateResult rTmp = [operator_Gcd gcd2:n1 n2:n2];
    
    if(rTmp.number == 0) {
        return r;
    }
    
    r.number = N1 * N2 / rTmp.number;
    return r;
}
@end

//不小于某数的最小整数
@implementation Operator_Ceil
-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    r.number = ceil(n1.number);
    return r;
}
@end

//不大于某数的最大整数
@implementation Operator_Floor
-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    r.number = floorl(n1.number);
    return r;
}

@end

//四舍五入
@implementation Operator_Round

-(CaculateResult) caculate1:(Number *)n1 {
    CaculateResult r = { 0 };
    r.number = roundl(n1.number);
    return r;
}
@end


@implementation Operator_Pow1

-(CaculateResult) caculate1:(Number *)n1 {
    
    CaculateResult r = { 0 };
    
    if(n1.exData && n1.exData.count > 0) {
        Operator_Pow *pow = [[Operator_Pow alloc]init];
        return [pow caculate2:n1 n2:[n1.exData objectAtIndex:0]];
    }
    
    r.retcode = CACULAT_PARAMETER_COUNT;
    return r;
}

@end


//开平方
@implementation Operator_Sqrt : Operator

-(CaculateResult) caculate1:(Number *)n1 {
    
    if(n1.number < 0) {
        CaculateResult r = { 0 };
        r.retcode = CACULAT_SQRT_MINUS;
        return r;
    }
    
    Operator_Pow *pow = [[Operator_Pow alloc]init];
    return [pow caculate2:n1 n2:[[Number alloc]initWithNumber:0.5]];
}
@end

//开立方
@implementation Operator_Cube : Operator
-(CaculateResult) caculate1:(Number *)n1 {
    Operator_Pow *pow = [[Operator_Pow alloc]init];
    return [pow caculate2:n1 n2:[[Number alloc]initWithNumber:1.0f / 3]];
}
@end

//ln
@implementation Operator_Ln : Operator
-(CaculateResult) caculate1:(Number *)n1 {
    
    CaculateResult r = { 0 };
    if(n1.number <= 0 || n1.number == 1) {
        r.retcode = CACULAT_LOG_MINUS;
        return r;
    }
    
    r.number = logl(n1.number);
    
    return r;
}
@end


//
@implementation Operator_Lg : Operator

-(CaculateResult) caculate1:(Number *)n1 {
    
    CaculateResult r = { 0 };
    if(n1.number <= 0 || n1.number == 1) {
        r.retcode = CACULAT_LOG_MINUS;
        return r;
    }
    
    r.number = log10l(n1.number);
    
    return r;
}
@end


//
@implementation Operator_Log : Operator

-(CaculateResult) caculate1:(Number *)n1 {
    
    CaculateResult r = { 0 };
    if(n1.number <= 0 || n1.number == 1) {
        r.retcode = CACULAT_LOG_MINUS;
        return r;
    }
    
    if(!n1.exData || n1.exData.count == 0) {
        r.retcode = CACULAT_PARAMETER_COUNT;
        return r;
    }
    
    Number* n2 = [n1.exData objectAtIndex:0];
    r.number = log10l(n2.number) / log10l(n1.number);
    
    return r;
}

@end

