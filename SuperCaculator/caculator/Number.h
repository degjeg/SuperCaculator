//
//  Number.h
//  GlossButton
//
//  Created by danger on 15/6/28.
//
//


#import <Foundation/Foundation.h>

typedef long double LDouble;

@interface Number : NSObject<NSCopying>


@property(nonatomic, assign) BOOL valid;
@property(nonatomic, assign) LDouble number;
@property(nonatomic, retain) NSMutableArray* exData;//扩展数据


-(instancetype) initWithNumber:(LDouble) number;

-(void) addData:(LDouble) data;

@end
