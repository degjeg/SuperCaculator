//
//  Caculator.h
//  GlossButton
//
//  Created by danger on 15/6/17.
//
//

#import <UIKit/UIKit.h>
#import "Operator.h"


@interface ScanResult : NSObject

enum ScanResultType{
    TYPE_ERROR = 0,
    TYPE_NUMBER,
    TYPE_OPERATOR,
    
};

@property(nonatomic, assign) int type;
@property(nonatomic, assign) LDouble number;
@property(nonatomic, assign) NSRange range;
@property(nonatomic, retain) Operator* operator;


@end


@interface Caculator : UIView


@property(copy)NSString* expression;

@property(retain) NSMutableArray* numbers;//Array Of Number

@property(retain) NSMutableArray* sos;//supported operator s
@property(retain) NSMutableArray* operators;//Array of operator

@property(nonatomic, assign)id last;

@property(nonatomic, assign) ScanResult* lastResult;

//计算指定表达式的值
-(CaculateResult)evaulateExpression:(NSString*)expression;


@end
