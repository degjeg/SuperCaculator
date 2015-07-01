//
//  Number.h
//  GlossButton
//
//  Created by danger on 15/6/28.
//
//

#import "Operator.h"

@interface Number : NSObject

@property(assign, nonatomic) LDouble number;


-(instancetype) initWithNumber:(LDouble) number;
@end
