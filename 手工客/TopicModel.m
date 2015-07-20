//
//  TopicModel.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel
+(id)topicWithDict:(NSDictionary *)dict
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
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}
@end
