//
//  QTimer.h
//  定时器
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTimerDisplay : UIView
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, assign)NSUInteger startTime;
@property (nonatomic, assign)NSUInteger startTimeBackup;
@property (nonatomic, assign)NSUInteger endTime;
@property (nonatomic, assign)NSUInteger endTimeBackup;

- (instancetype)initWithFrame:(CGRect)frame andStartTime:(NSUInteger)s_time stopTime:(NSUInteger)e_time;
@end
