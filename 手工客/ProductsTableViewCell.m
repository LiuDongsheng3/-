//
//  ProductsTableViewCell.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ProductsTableViewCell.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
//#import "QTimerDisplay.h"
@interface ProductsTableViewCell()
{
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *secLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;




@property (nonatomic, assign)NSUInteger startTime;
@property (nonatomic, assign)NSUInteger startTimeBackup;
@property (nonatomic, assign)NSUInteger endTime;
@property (nonatomic, assign)NSUInteger endTimeBackup;
@end
@implementation ProductsTableViewCell
- (void)updateTime
{
    _endTimeBackup--;
    if (_endTimeBackup <= _startTime) {
        [_timer invalidate];
    }
    [self currentTimeWithSeconds:_endTimeBackup];
}
- (void)currentTimeWithSeconds:(NSUInteger)currentSecond
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentSecond];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *timeString= [dateFormatter stringFromDate:date];
    self.hourLabel.text=timeString;
    NSLog(@"%@",timeString);

}
- (void)aaaWithStartTime:(NSUInteger)s_time stopTime:(NSUInteger)e_time
{
 
        
        _startTime = s_time;
        _endTime = e_time;
        _startTimeBackup = s_time;
        _endTimeBackup = e_time;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];



}
-(void)setProductsModel:(ProductsModel *)productsModel{
    _productsModel =productsModel;
    NSURL * url =[NSURL URLWithString:productsModel.host_pic];
    [self.backImageView setImageWithURL:url];
    self.priceLabel.text = productsModel.price;
    self.messageLabel.text = productsModel.subject;
   // [self aaaWithStartTime:productsModel.start_time stopTime:productsModel.end_time];
   // self.hourLabel=(UILabel*)time;
    
    

}

+(id)productsCellWithTableView:(UITableView *)tableView
{
    NSString * Identifier = NSStringFromClass([self class]);
    UINib * nib = [UINib nibWithNibName:Identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:Identifier];
    
    return [tableView dequeueReusableCellWithIdentifier:Identifier];
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
