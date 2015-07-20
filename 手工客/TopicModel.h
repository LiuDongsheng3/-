//
//  TopicModel.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject
@property (nonatomic ,copy)NSString * ids;
@property (nonatomic ,copy)NSString * subject;
@property (nonatomic ,copy)NSMutableArray * pic;
@property (nonatomic ,copy)NSString * Ym;
@property (nonatomic ,copy)NSString * d;
@property (nonatomic ,copy)NSString * w;
@property (nonatomic ,copy)NSString * page;

+(id)topicWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
