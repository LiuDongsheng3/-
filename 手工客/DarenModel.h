//
//  DarenModel.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DarenModel : NSObject
//达人推荐
@property (nonatomic ,copy)NSString * circle_count;
@property (nonatomic ,copy)NSString * circle_collect_count;
@property (nonatomic ,copy)NSString * fen_num;
@property (nonatomic ,copy)NSString * guan_num;
@property (nonatomic ,copy)NSString * guan_status;
@property (nonatomic ,copy)NSString * coursecount;
@property (nonatomic ,copy)NSString * coursedraft;
@property (nonatomic ,copy)NSString * coursecollect;
@property (nonatomic ,copy)NSString * uname;
@property (nonatomic ,copy)NSString * title;
@property (nonatomic ,copy)NSString * gender;
@property (nonatomic ,copy)NSString * region;
@property (nonatomic ,copy)NSString * daren;
@property (nonatomic ,copy)NSString * class_count;
@property (nonatomic ,copy)NSString * hand_teacher;
@property (nonatomic ,copy)NSString *real_name;
@property (nonatomic ,copy)NSMutableArray * level;
@property (nonatomic ,copy)NSString * avatar;
@property (nonatomic ,copy)NSString * bg_image;
@property (nonatomic ,copy)NSString * uid;

+(id)darenWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
