//
//  Adv.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Adv : NSObject

@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *ad_img;
@property (nonatomic,copy)NSString *action;
@property (nonatomic,copy)NSString *id;

@property (nonatomic,copy)NSString *height;
@property (nonatomic,copy)NSString *width;

+(id)advWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
