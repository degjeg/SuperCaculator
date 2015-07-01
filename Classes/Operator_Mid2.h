//
//  Operator_Add.h
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import <UIKit/UIKit.h>
#import "Operator.h"

@interface Operator_Mid2 : Operator
-(CaculateResult)caculate:(LDouble)n1 n2:(LDouble)n2;

@end

@interface Operator_Add : Operator_Mid2
@end

@interface Operator_Sub : Operator_Mid2
@end

@interface Operator_Mul : Operator_Mid2
@end

@interface Operator_Div : Operator_Mid2
@end

@interface Operator_Pow : Operator_Mid2
@end


