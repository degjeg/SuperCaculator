//
//  Expression.m
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import "Expression.h"
#import "Operator_Mid2.h"
#import "Operator_Pre1.h"
#import "Operator_End1.h"


@implementation Expression

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.expression = [[NSMutableString alloc]init];
    }
    return self;
}
-(void) add:(NSString*) toAdd at:(int)pos {
    
    unichar last = (self.expression.length > 0) ? [self.expression characterAtIndex:self.expression.length-1] : 0;
    
    Operator* operator = [self getOperator:toAdd];
    
    if ([toAdd isEqual:@"±"]) {
        [self solvePlusMinus];
    } else if(operator || [self isBracket:toAdd]) {
        [self removeOperator:operator];
        [self.expression appendString:toAdd];
    } else if([toAdd isEqual:@"."]) {
        if(self.expression.length == 0 || (last && !isdigit(last) && last != '.')) {
            [self.expression appendString:@"0."];
        } else {
            if(![self haveAPoint]) {//不能以.结束
                [self.expression appendString:@"."];
            }
        }
    } else if(isdigit([toAdd characterAtIndex:0]) && [self.expression isEqual:@"0"]) {
        [self.expression setString:toAdd];
    } else {
        [self.expression appendString:toAdd];
    }
}

-(void) clear {
    [self.expression setString:@"0"];
}

//最后一个数字是否已经有小数点
-(BOOL) haveAPoint {
    for(int i = (int)self.expression.length - 1; i >= 0; i--) {
        unichar last = [self.expression characterAtIndex:i];
        if(last == '.') {
            return YES;
        } else if(!isdigit(last)) {
            return FALSE;
        }
    }
    return NO;
}

-(Operator*) getOperator:(NSString*) ex {
    for(Operator *operator in self.caculator.sos) {
        if([operator matchString:ex]) {
            return operator;
        }
    }
    
    return nil;
}

-(Operator*) endingOperator {
    
    for(int i = 1; i <= 4 && self.expression.length >= i; i++) {
        NSString* sub = [self.expression substringFromIndex:self.expression.length- i];
        for(Operator *operator in self.caculator.sos) {
            if([operator matchString:sub]) {
                return operator;
            }
        }
    }
    
    return nil;
}

-(void) removeOperator:(Operator*) op {
    if(!op) {
        return ;
    }
    
    Operator* endingOp = [self endingOperator];
    
    while(endingOp && [self shouldReplace:endingOp op2:op]) {
        for(NSString* opName in endingOp.names) {
            if([self.expression hasSuffix:opName]) {
                NSRange range = NSMakeRange(self.expression.length - opName.length, opName.length);
                [self.expression deleteCharactersInRange:range];
                
                endingOp = [self endingOperator];
                break;
            }
        }
    }
}
-(BOOL) shouldReplace:(Operator*)op1 op2:(Operator*)op2 {
    if( [op2 isMemberOfClass:[Operator_Add class]]
       || [op2 isMemberOfClass:[Operator_Mul class]]
       || [op2 isMemberOfClass:[Operator_Div class]]
       ) {
        return YES;
    }
    
    if([op2 isMemberOfClass:[Operator_Sub class]]) {//
        if([op1 isMemberOfClass:[Operator_Sub class]]) {
            return YES;
        }
    }
    
    return NO;
}

-(BOOL) isBracket:(NSString*) ex {
    NSRange range = [@"()[]{}" rangeOfString:ex];
    
    return range.location != NSNotFound;
}


-(void) solvePlusMinus {
    int i = (int)self.expression.length - 1;
    
    int digitEnd = 0;
    int digitStart = 0;
    int minusCount = 0;
    int maxCount = 1;
    BOOL isDigitBefore = NO;
    for(; i >= 0; i--) {
        unichar c = [self.expression characterAtIndex:i];
        if(!(isdigit(c) || c == '.')) {
            continue;
        } else {
            break;
        }
    }
    
    digitEnd = i;
    for(; i >= 0; i--) {
        unichar c = [self.expression characterAtIndex:i];
        if(isdigit(c) || c == '.') {
            continue;
        } else {
            break;
        }
    }
    
    digitStart = i + 1;
    
    if(digitStart < 0) {
        return;
    }
    for(; i >= 0; i--) {
        unichar c = [self.expression characterAtIndex:i];
        if(c == '-') {
            minusCount++;
        } else {
            break;
        }
    }
    if(i > 0) {
        unichar c = [self.expression characterAtIndex:i];
        isDigitBefore = isdigit(c) || c == '.';
    }

    if(isDigitBefore) {
        maxCount = 2;
    }
    
    if(minusCount >= maxCount) {
        //remove
        [self.expression deleteCharactersInRange:NSMakeRange(digitStart-1, 1)];
    } else {
        //add
        [self.expression insertString:@"-" atIndex:digitStart];
    }

}
@end
