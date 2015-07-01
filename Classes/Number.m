//
//  Number.m
//  GlossButton
//
//  Created by danger on 15/6/28.
//
//

#import "Number.h"

@implementation Number

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype) initWithNumber:(LDouble) number {
    if( self  = [super init]) {
        self.number = number;
    
    }
    
    return self;
}
@end
