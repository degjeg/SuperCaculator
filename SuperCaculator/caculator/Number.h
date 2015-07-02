//
//  Number.h
//  GlossButton
//
//  Created by danger on 15/6/28.
//
//

#import "Operator.h"

@interface Number : NSObject<NSCopying>


@property(assign, nonatomic) BOOL valid;
@property(assign, nonatomic) LDouble number;


-(instancetype) initWithNumber:(LDouble) number;
@end
