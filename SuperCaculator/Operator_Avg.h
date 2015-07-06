//
//  Operator_n.h
//  SuperCaculator
//
//  Created by danger on 15/7/6.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Operator.h"


//算术平均数
//(x1+x2...)/n
@interface Operator_Avg : Operator
@end

//几何平均数
//pow(x1*x2*x3..., 1/n)
@interface Operator_AvgG : Operator
@end

//调和平均数
//n/(1/x1+1/x2...)
@interface Operator_AvgH : Operator
@end

//平方平均数
//sqrt((x1^2+x2^2+...)/n)
@interface Operator_AvgM : Operator
@end






