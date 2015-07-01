//
//  Operator_Pre1.h
//  GlossButton
//
//  Created by danger on 15/6/27.
//
//

#import "Operator.h"

@interface Operator_Pre1 : Operator
-(CaculateResult)caculate:(LDouble)n1;
@end

@interface Operator_Sin : Operator_Pre1
@end

@interface Operator_Cos : Operator_Pre1
@end

@interface Operator_Tan : Operator_Pre1
@end

@interface Operator_Cot : Operator_Pre1
@end



@interface Operator_ASin : Operator_Pre1
@end

@interface Operator_ACos : Operator_Pre1
@end

@interface Operator_ATan : Operator_Pre1
@end

@interface Operator_ACot : Operator_Pre1
@end

