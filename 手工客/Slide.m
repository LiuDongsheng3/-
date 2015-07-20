//
//  Slide.m
//  手工客
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "Slide.h"

@implementation Slide
+(id)appWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
