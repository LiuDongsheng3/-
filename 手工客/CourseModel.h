//
//  courseModel.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject
//热门教学
@property (nonatomic ,copy)NSString * subject;
@property (nonatomic ,copy)NSString * host_pic;
@property (nonatomic ,copy)NSString * hand_id;
@property (nonatomic ,copy)NSString * user_name;
@property (nonatomic ,copy)NSString * user_id;
@property (nonatomic ,copy)NSString * avatar;
@property (nonatomic ,copy)NSString * is_daren;
@property (nonatomic ,copy)NSString * page;

+(id)courseWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
