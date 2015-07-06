//
//  Caculator.m
//  GlossButton
//
//  Created by danger on 15/6/17.
//
//

#import "Caculator.h"
#import "Operator_Mid2.h"
#import "Operator_Pre1.h"
#import "Operator_End1.h"
#import "Operator_Avg.h"
#import "Operator_Com.h"

#import "Number.h"


@implementation ScanResult

-(NSString*)description {
    if(self.type == TYPE_NUMBER) {
        NSLog(@"%d[%d-%d]%@", self.type, self.range.location, self.range.location + self.range.length, self.number);
    } else if(self.type == TYPE_OPERATOR) {
        NSLog(@"%d[%d-%d]%@", self.type, self.range.location, self.range.location + self.range.length, self.operator.names);
    } else {
        NSLog(@"%d error", self.type);
    }
    
    return @"";
}
@end



@implementation Caculator




- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numbers = [[NSMutableArray alloc]init];
        self.operators = [[NSMutableArray alloc]initWithCapacity:100];
        self.sos = [[NSMutableArray alloc]initWithCapacity:100];
        
        [self.sos addObject:[[Operator_Add alloc] initWithType:OPERATOR_MID name:@"+" pc:2 pro:OPERATOR_PRIVORITY_ADD]];
        [self.sos addObject:[[Operator_Sub alloc] initWithType:OPERATOR_MID name:@"-" pc:2 pro:OPERATOR_PRIVORITY_ADD]];
        [self.sos addObject:[[Operator_Mul alloc] initWithType:OPERATOR_MID name:@"*" pc:2 pro:OPERATOR_PRIVORITY_MUL]];
        [self.sos addObject:[[Operator_Div alloc] initWithType:OPERATOR_MID name:@"/" pc:2 pro:OPERATOR_PRIVORITY_MUL]];
        
        [self.sos addObject:[[Operator_Pow alloc] initWithType:OPERATOR_MID name:@"^" pc:2 pro:OPERATOR_PRIVORITY_POW]];
        
        //三角函数
        [self.sos addObject:[[Operator_Sin alloc] initWithType:OPERATOR_PRE name:@"sin" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Cos alloc] initWithType:OPERATOR_PRE name:@"cos" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Tan alloc] initWithType:OPERATOR_PRE name:@"tan" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Cot alloc] initWithType:OPERATOR_PRE name:@"cot" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        
        [self.sos addObject:[[Operator_ASin alloc] initWithType:OPERATOR_PRE name:@"asin" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_ACos alloc] initWithType:OPERATOR_PRE name:@"acos" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_ATan alloc] initWithType:OPERATOR_PRE name:@"atan" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_ACot alloc] initWithType:OPERATOR_PRE name:@"acot" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        
        //common
        [self.sos addObject:[[Operator_Min alloc] initWithType:OPERATOR_PRE name:@"min" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Max alloc] initWithType:OPERATOR_PRE name:@"max" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Abs alloc] initWithType:OPERATOR_PRE name:@"abs" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Gcd alloc] initWithType:OPERATOR_PRE name:@"gcd" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Lcm alloc] initWithType:OPERATOR_PRE name:@"lcm" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Ceil alloc] initWithType:OPERATOR_PRE name:@"ceil" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Floor alloc] initWithType:OPERATOR_PRE name:@"floor" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Round alloc] initWithType:OPERATOR_PRE name:@"round" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        
        //开平方
        [self.sos addObject:[[Operator_Cube alloc] initWithType:OPERATOR_PRE name:@"cube" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Sqrt alloc] initWithType:OPERATOR_PRE name:@"sqrt" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Pow1 alloc] initWithType:OPERATOR_PRE name:@"pow" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Ln alloc] initWithType:OPERATOR_PRE name:@"ln" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Lg alloc] initWithType:OPERATOR_PRE name:@"lg" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_Log alloc] initWithType:OPERATOR_PRE name:@"log" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        
        //指数
        [self.sos addObject:[[Operator_Pow1 alloc] initWithType:OPERATOR_PRE name:@"pow" pc:1 pro:OPERATOR_PRIVORITY_SIN]];

        //Average
        [self.sos addObject:[[Operator_Avg alloc] initWithType:OPERATOR_PRE name:@"avg" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_AvgG alloc] initWithType:OPERATOR_PRE name:@"avgg" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_AvgH alloc] initWithType:OPERATOR_PRE name:@"avgh" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        [self.sos addObject:[[Operator_AvgM alloc] initWithType:OPERATOR_PRE name:@"avgm" pc:1 pro:OPERATOR_PRIVORITY_SIN]];

        
        [self.sos addObject:[[Operator_Fac alloc] initWithType:OPERATOR_END name:@"!" pc:1 pro:OPERATOR_PRIVORITY_SIN]];
        
    }
    return self;
}

-(void) setUnit:(Unit)unit {
    for(Operator *operator in self.sos) {
        operator.unit = unit;    
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)reset {
    [self.operators removeAllObjects];
    [self.numbers removeAllObjects];
    self.lastResult = nil;
}
//计算指定表达式的值
-(CaculateResult)evaulateExpression:(NSString*)expression {
    expression = [expression lowercaseString];//小写
//    expression = [expression stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //去除换行，空格
    expression = [expression stringByReplacingOccurrencesOfString:@" " withString:@""];
    expression = [expression stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    expression = [expression stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    self.expression = expression;
    ScanResult *scanResult = [[ScanResult alloc]init];
    scanResult.range = NSMakeRange(0, 0);
    CaculateResult caculateResult = { 0 };
    
    caculateResult.retcode = [self precheck] ;
    if(caculateResult.retcode!= CACULAT_OK) {
        return caculateResult;
    }
    do {
        int pos = (int)(scanResult.range.location + scanResult.range.length);
//        NSLog(@"now scan:%d", pos);
        scanResult = [self scanString:expression pos:pos];
        
//        scanResult.description;

//        lastResult =
        if(scanResult) {
            if(scanResult.type == TYPE_NUMBER) {
                caculateResult.retcode = [self numberGot:[[Number alloc] initWithNumber:scanResult.number]];
                if(caculateResult.retcode != CACULAT_OK) {
                    return caculateResult;
                }
            } else if(scanResult.type == TYPE_OPERATOR) {
                Operator* operator = scanResult.operator;
                if([operator matchString:@"("]) {//如果是括号，递归调用
                    NSString*subExpression = [self getSubExpression:self.expression pos:(int)scanResult.range.location];
                    if(subExpression && subExpression.length > 0) {
                        caculateResult.retcode = [self caculateSubExpression:subExpression];
                        scanResult.range = NSMakeRange(scanResult.range.location, subExpression.length + 2);
                        scanResult.type = TYPE_NUMBER;
                        if(caculateResult.retcode != CACULAT_OK) {
                            NSLog(@"caculate error:%lu", (unsigned long)scanResult.range.location);
                            return caculateResult;
                        }
                    } else {
                        NSLog(@"BRACKET not match:%lu", (unsigned long)scanResult.range.location);
                        caculateResult.retcode = CACULAT_ERROR;
                        return caculateResult;
                    }
//                    NSString* subExpression =
                    
                } else {
                    if(operator.parameterCount == 0) {
                        scanResult.type = TYPE_NUMBER;
                    }
                    caculateResult.retcode = [self operatorGot:operator];
                    if(caculateResult.retcode != CACULAT_OK) {
                        return caculateResult;
                    }
                }
            } else {//error
                break;
            }
            
            if(scanResult.type != TYPE_ERROR) {
                if(scanResult.range.length + scanResult.range.location >= expression.length) {//scan end
                    caculateResult.retcode = [self scanFinish];
                    if(caculateResult.retcode == CACULAT_OK) {
                        Number* number = [self.numbers objectAtIndex:0];
                        caculateResult.number = number.number;
                    }
                    
                    return caculateResult;
                   
                } else {//do nothing
                
                }
            }
        }
        
        self.lastResult = scanResult;
    } while(scanResult && scanResult.type != TYPE_ERROR);

  
    CaculateResult result;
    result.retcode = CACULAT_ERROR;
    return result;
}

-(int)precheck {
    int leftCount = 0;
    int rightCount = 0;
    for(int i = 0; i < self.expression.length; i++) {
        unichar c = [self.expression characterAtIndex:i];
        if(c == '(' || c == '[' || c == '{') {
            leftCount++;
        } else if (c == ')' || c == ']' || c == '}') {
            rightCount++;
        }
    }
    
    if(leftCount != rightCount) {
        return CACULAT_BRACKET_NOT_MATCH;
    }
    
    return CACULAT_OK;
}


-(int)numberGot:(Number*)number {
    
    Operator* operator;
    
  
    operator = [self getOperator];
    
    if(operator && operator.type == OPERATOR_PRE) {
        CaculateResult caculateResult = [operator caculate1:number];
        if(CACULAT_OK != caculateResult.retcode) { //计算失败，如sqrt(-1)，则会计算失败，不能算-1的平方根
            return caculateResult.retcode;
        }
        
        [self popOperator];
        [self pushNumber:caculateResult.number];
        
        return CACULAT_OK;
    } else if(!operator) {//运算符已为空，计算完毕
        
    } else {
        if(self.operators.count >= 2) {
            Operator* operator1 = [self.operators objectAtIndex:self.operators.count - 1];
            Operator* operator2 = [self.operators objectAtIndex:self.operators.count - 2];
            
            if(operator2.privority >= operator1.privority) {
                if(self.numbers.count < (operator2.parameterCount )) {
                    return CACULAT_PARAMETER_COUNT;
                }
                NSRange range = NSMakeRange(self.numbers.count - operator2.parameterCount , operator2.parameterCount);
                NSArray*parameter = [self.numbers subarrayWithRange:range];
                [self.numbers removeObjectsInRange:range];
                
                CaculateResult caculateResult = [operator2 caculate:parameter];
                
                if(CACULAT_OK != caculateResult.retcode) {
                    return caculateResult.retcode;
                }
                
                [self pushNumber:caculateResult.number];
                //                    [self pushNumber:number];
                //                    [self pushOperator:operator];
                [self.operators removeObjectAtIndex:self.operators.count - 2];
            }
        }
    }
    
    
    [self pushNumber:number.number];
    
    return CACULAT_OK;
}


-(int)operatorGot:(Operator*)operator {
    
    if(operator.parameterCount == 0) {
//        LDouble lddouble = ;
        Number* number = [[Number alloc]initWithNumber:[operator caculate:0].number];
        [self numberGot:number];
        
        
        return CACULAT_OK;
    } else if(operator.type == OPERATOR_END) { //后置运算符
        if(self.lastResult && self.lastResult.type == TYPE_NUMBER) {//上次是个数字
            Number* number = [self popNumber];
            CaculateResult caculateResult = [operator caculate1:number];
            if(CACULAT_OK != caculateResult.retcode) {
                 return caculateResult.retcode;
            }
            [self pushNumber:caculateResult.number];
            return CACULAT_OK;
        }
    } else {
        Operator *operator1 = [self getOperator];//last operator
        
        do {
            if(operator1 && operator1.privority >= operator.privority && operator1.type != OPERATOR_PRE) {//前在的优先级更高
                if(operator1.parameterCount > self.numbers.count) {
                    return CACULAT_PARAMETER_COUNT;
                }
                
                NSRange range = NSMakeRange(self.numbers.count - operator1.parameterCount, operator1.parameterCount);
                NSArray*parameter = [self.numbers subarrayWithRange:range];
                [self.numbers removeObjectsInRange:range];
                
                CaculateResult caculateResult = [operator1 caculate:parameter];
                
                if(CACULAT_OK != caculateResult.retcode) {
                    return caculateResult.retcode;
                }
                
                [self pushNumber:caculateResult.number];
                [self popOperator];
                [self pushOperator:operator];
                return CACULAT_OK;
            }
        } while(0);
    }
    
    [self pushOperator:operator];
    return CACULAT_OK;
}

-(int)scanFinish {//从后往前算
//    NSLog(@"scan finish");
    
    Operator *operator = [self popOperator];
    
    while(operator) {
        if(operator.parameterCount > self.numbers.count) {
            return CACULAT_PARAMETER_COUNT;
        }
        
        NSRange range = NSMakeRange(self.numbers.count - operator.parameterCount, operator.parameterCount);
        NSArray*parameter = [self.numbers subarrayWithRange:range];
        [self.numbers removeObjectsInRange:range];
        
        CaculateResult caculateResult = [operator caculate:parameter];
        
        if(CACULAT_OK != caculateResult.retcode) {
            return caculateResult.retcode;
        }
        
        [self pushNumber:caculateResult.number];
        
        operator = [self popOperator];
    }
    
    if(self.numbers.count != 1 || self.operators.count != 0) {
        return CACULAT_ERROR;
    }
    
    return CACULAT_OK;
}

-(void)pushOperator:(Operator*)op {
    [self.operators addObject:op];
}

-(void)pushNumber:(LDouble)op {
    Number* number = [[Number alloc]initWithNumber:op];
    [self.numbers addObject:number];
}


-(Operator*)popOperator {
    if(self.operators.count > 0) {
        Operator* operator = [self.operators objectAtIndex:self.operators.count - 1];
        [self.operators removeObjectAtIndex:self.operators.count - 1];
        return operator;
    }
    
    return nil;
}
-(Operator*)getOperator {
    if(self.operators.count > 0) {
        Operator* operator = [self.operators objectAtIndex:self.operators.count - 1];
//        [self.operators removeObjectAtIndex:self.operators.count - 1];
        return operator;
    }
    
    return nil;
}

-(Number*)popNumber {
    if(self.numbers.count > 0) {
        Number* number = [self.numbers objectAtIndex:self.numbers.count - 1];
        [self.numbers removeObjectAtIndex:self.numbers.count - 1];
        return number;
    }
    
    return nil;
}

-(NSString*) getSubExpression:(NSString*)ex pos:(int)pos {
    int leftCount = 0;
    int rightCount = 0;
    
    for(int i = pos; i < self.expression.length; i++) {
        unichar c = [self.expression characterAtIndex:i];
        if(c == '(' || c == '[' || c == '{') {
            leftCount++;
        } else if (c == ')' || c == ']' || c == '}') {
            rightCount++;
        }
    
        if(leftCount == rightCount) {
            NSString*subEx = [ex substringWithRange:NSMakeRange(pos + 1, i - pos - 1)];
            return subEx;
        }
    }
//    NSRange range = [ex rangeOfString:@")" options:NSBackwardsSearch range:NSMakeRange(pos, ex.length - pos)] ;
//
//    if(range.location == NSNotFound) {
//        range = [ex rangeOfString:@"]" options:NSBackwardsSearch range:NSMakeRange(pos, ex.length - pos)];
//    }
//    
//    if(range.location == NSNotFound) {
//        range = [ex rangeOfString:@"}" options:NSBackwardsSearch range:NSMakeRange(pos, ex.length - pos)];
//    }
//    
//    if(range.location != NSNotFound && range.location > pos + 1) {
//        
//    }
    
    return nil;
}


-(int) caculateSubExpression:(NSString*)subExpression {
    
//    if([self canCaculateDirectly:subExpression]) {//没有包含，
//        Caculator *caculatorTmp = [[Caculator alloc]init];
//        caculatorTmp.expression = subExpression;
//        caculatorTmp.sos = self.sos;
//        return [caculatorTmp evaulateExpression:subExpression];
//    }
    
    //如果有，就比较复杂了，把表达式按，进行分割
    NSMutableArray* subExpressionList = [[NSMutableArray alloc]init];
    NSMutableString*subSubExpression = [[NSMutableString alloc]init];
    int bracketCount = 0;
    int lastPos = 0;
    
    int i = 0;
    for(; i < subExpression.length; i++) {
        unichar charAti = [subExpression characterAtIndex:i];
        
        [subSubExpression appendString:@""];
        if(charAti == ',') {
            if(bracketCount == 0) {
                NSRange range = NSMakeRange(lastPos, i - lastPos);
                [subExpressionList addObject:[subExpression substringWithRange:range]];
//                subSubExpression = [[NSMutableString alloc]init];//重新创建一个新的
                lastPos = i + 1;
            }
        } else {
//            NSString *appendString = [NSString stringWithCharacters:&charAti length:1];
//            [subSubExpression appendFormat:@"%@", appendString];
            
            if(charAti == '(') {
                bracketCount++;
            } else if(charAti == ')') {
                bracketCount--;
            }
        }
    }
    if(lastPos < subExpression.length) {
        [subExpressionList addObject:[subExpression substringFromIndex:lastPos]];
    }
    
    Number* number = [[Number alloc]init];
    for(NSString* subsub in subExpressionList) {
        Caculator *caculatorTmp = [[Caculator alloc]init];
        caculatorTmp.sos = self.sos;
        CaculateResult resultTmp = [caculatorTmp evaulateExpression:subsub];
        
        if(resultTmp.retcode != CACULAT_OK) {//计算失败
            return resultTmp.retcode;
        }
        
        //计算成功
        if(!number.valid) {
            number.number = resultTmp.number;
            number.valid = YES;
        } else {
            [number addData:resultTmp.number];
        }
        
    }
    
    return [self numberGot:number];
}

-(BOOL) canCaculateDirectly:(NSString*)subExpression {
    int bracketCount = 0;
    for(int i = 0; i < subExpression.length; i++) {
        unichar charAti = [subExpression characterAtIndex:i];
        
        if(charAti == ',') {
            if(bracketCount == 0) {
                return NO;
            }
        } else if(charAti == '(') {
            bracketCount++;
        } else if(charAti == ')') {
            bracketCount--;
        }
    }

    return YES;
}
-(ScanResult*)scanString:(NSString*)expression pos:(int)pos {
//    expression = [expression stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除换行，空格

    //escape empty characters
    
//    NSString* expressionTmp = [expression substringFromIndex:pos];
    if(expression.length == 0) {
        return nil;
    }
    
    unichar c0 = [expression characterAtIndex:pos];
    unichar c1 = (pos < self.expression.length - 1) ? [expression characterAtIndex:pos + 1] : 0;
    
    ScanResult* result = [[ScanResult alloc]init];
    //+号前面如果是数字，理解为加，否则理解为正号
    //-号前面如果是数字，理解为减，否则理解为负号
//
    if((isdigit(c0) || c0 == '.')//是个数字
    || ((!self.lastResult || self.lastResult.type != TYPE_NUMBER) //上一个空或者是数字
       && ((c0 == '-' || c0 == '+') && (isdigit(c1) || c1 == '.')) //正号或者负号
        )) {
        
        int end = pos + 1;
        while(end < expression.length) {
            c0 = [expression characterAtIndex:end];
            if(!(isdigit(c0) || c0 == '.')) {
                break;
            }
            end++;
        }
        end--;
        
        NSString*sub = [expression substringWithRange:NSMakeRange(pos, end - pos + 1)];
        result.number = [sub doubleValue];
        result.type = TYPE_NUMBER;
        result.range = NSMakeRange(pos, end - pos + 1);
        return result;
    } else { //必须是符号
        if(c0 == '(' || c0 == '[' || c0 == '{') { //括号
            result.type = TYPE_OPERATOR;
            result.operator = [[Operator alloc]initWithType:0 name:@"(" pc:0 pro:0];
            result.range = NSMakeRange(pos, 1);
            return result;
        } else {
            for (int i = pos; i < expression.length; i++) {
                NSString*sub = [expression substringWithRange:NSMakeRange(pos, i - pos + 1)];
                
                for(int j = 0; j < self.sos.count; j++) {
                    Operator* operator = [self.sos objectAtIndex:j] ;
                    if([operator matchString:sub]) {
                        result.operator = operator;
                        result.type = TYPE_OPERATOR;
                        result.range = NSMakeRange(pos, i - pos + 1);
                        return result;
                    }
                }
            }
            
            result.type = TYPE_ERROR;
            return result;///error happened
        }
    }
}



@end
