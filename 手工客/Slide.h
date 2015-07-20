//
//  Slide.h
//  手工客
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Slide : NSObject


@property (copy,nonatomic) NSString *host_pic;
@property (copy,nonatomic) NSString *subject;
@property (copy,nonatomic) NSString *step_count;
@property (copy,nonatomic) NSString *user_name;
@property (copy,nonatomic) NSString *hand_daren;
@property (copy,nonatomic) NSString *itemtype;
@property (copy,nonatomic) NSString *hand_id;
@property (copy,nonatomic) NSString *is_expired;

+(id)appWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
