//
//  ClasssModel.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClasssModel : NSObject
@property (nonatomic ,copy)NSString * subject;
@property (nonatomic ,copy)NSString * ids;
@property (nonatomic ,copy)NSString * host_pic;


+(id)classsWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
