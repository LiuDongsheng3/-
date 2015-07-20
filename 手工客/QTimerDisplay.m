//
//  QTimer.m
//  定时器
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QTimerDisplay.h"

@interface QTimerDisplay ()

@end
@implementation QTimerDisplay
{
    NSTimer *_timer;
    
}

- (instancetype)initWithFrame:(CGRect)frame andStartTime:(NSUInteger)s_time stopTime:(NSUInteger)e_time
{
    if (self = [super initWithFrame:frame]) {
        
        _startTime = s_time;
        _endTime = e_time;
        _startTimeBackup = s_time;
        _endTimeBackup = e_time;
        _timeLabel = [[UILabel alloc]initWithFrame:self.bounds];
        [self addSubview:_timeLabel];
    }
    return self;
}

- (NSString *)currentTimeWithSeconds:(NSUInteger)currentSecond
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentSecond];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *timeString= [dateFormatter stringFromDate:date];
    NSLog(@"%@",timeString);
    
    return timeString;
}

- (void)didMoveToSuperview
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
}
- (void)updateTime
{
    _endTimeBackup--;
    if (_endTimeBackup <= _startTime) {
        [_timer invalidate];
    }
    _timeLabel.text = [self currentTimeWithSeconds:_endTimeBackup];
}

@end
