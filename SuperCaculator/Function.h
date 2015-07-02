//
//  Function.h
//  SuperCaculator
//
//  Created by danger on 15/7/1.
//  Copyright (c) 2015年 danger. All rights reserved.
//

#import "Operator.h"
#import "Number.h"


@interface Function : NSObject

@property(nonatomic, retain) NSString* function;
@property(nonatomic, retain) NSMutableDictionary* datas;
@property(nonatomic, retain) NSMutableArray* xs;


-(Number*) getValue:(LDouble)x;

@end
