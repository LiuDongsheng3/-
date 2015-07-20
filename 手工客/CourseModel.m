//
//  courseModel.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "CourseModel.h"

@implementation CourseModel
+(id)courseWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
