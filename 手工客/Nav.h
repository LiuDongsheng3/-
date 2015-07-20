//
//  Nav.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Nav : NSObject
@property (copy,nonatomic) NSString *subject;
@property (copy,nonatomic) NSString *host_pic;
@property (copy,nonatomic) NSString *itemtype;

+(id)appWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
