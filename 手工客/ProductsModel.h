//
//  ProductsModel.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductsModel : NSObject
//products  限时抢购  开始时间，结束时间
@property (nonatomic ,copy)NSString * subject;
@property (nonatomic ,copy)NSString * ids;
@property (nonatomic ,copy)NSString * host_pic;
@property (nonatomic ,assign)NSUInteger  start_time;
@property (nonatomic ,assign)NSUInteger  end_time;
@property (nonatomic ,copy)NSString *  price;

+(id)productsWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
