//
//  Expression.h
//  GlossButton
//
//  Created by danger on 15/6/20.
//
//

#import <UIKit/UIKit.h>
#import "Caculator.h"

@interface Expression : UIView

@property(nonatomic, retain) NSMutableString *expression;
@property(nonatomic, retain) Caculator *caculator;

-(void) add:(NSString*) toAdd at:(int)pos;

-(void) clear;
@end
