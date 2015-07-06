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
        self.valid = YES;
    }
    
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    [copy setValid:self.valid];
    [copy setNumber:self.number];
    return copy;
}


-(void) addData:(LDouble) data {
    if( !self.exData ) {
        self.exData = [[NSMutableArray alloc]init];
    }

    Number* number = [[Number alloc]initWithNumber:data];
    [self.exData addObject:number];
}
@end
