//
//  Operator.h
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import <UIKit/UIKit.h>

typedef long double LDouble;

typedef enum {
    OPERATOR_PRE, //1//前置运算符，符号在操作数的前面，如0x,0b,0o,sin,cos,....
    OPERATOR_MID, //2//运算符在中间的，如+,-,*,/,^,&,>>,<<,
    OPERATOR_END, //3//符号在数字后面，如!(阶乘),
} OperatorType;

typedef enum  {
    CACULAT_OK = 0,
    CACULAT_ERROR,
    CACULAT_DIVIDE_ZERO,//除以0错误
    CACULAT_TAN_90,//
    CACULAT_COT_0,//
    CACULAT_PARAMETER_COUNT,
    CACULAT_BRACKET_NOT_MATCH,
    
    CACULAT_FAC_MINUS,//不能计算负数的阶乘

} CaculateResultCode;

enum OperatorPriority {
    OPERATOR_PRIVORITY_ADD,//+，-
    OPERATOR_PRIVORITY_MUL,//*，/
    OPERATOR_PRIVORITY_POW,//*，/
    OPERATOR_PRIVORITY_SIN,//sin,cos,tan,asin,acos,atan,...
    OPERATOR_PRIVORITY_FAC,//!阶乘
};

typedef enum  {
    UNIT_ANGLE,//单位是角度
    UNIT_Radian,//弧度
    UNIT_Gradient,//梯度
    
} Unit;

typedef struct  {
    int retcode;
    LDouble number;
}CaculateResult;

@interface Operator : UIView


@property(copy) NSMutableArray* names;
@property(assign) OperatorType type;
@property(assign) int privority;
@property(assign) int parameterCount;
@property(assign) Unit unit;



-(id)initWithType:(OperatorType)type name:(NSString*)names pc:(int)parameterCount pro:(int)pro;

-(BOOL)matchString:(NSString*)str;

-(CaculateResult) caculate:(LDouble)number,...;//first number is return value

-(CaculateResult) caculateReal:(LDouble*) parameters;

-(LDouble) toRadian:(LDouble)number;

-(LDouble) toAngle:(LDouble)number;

@end
