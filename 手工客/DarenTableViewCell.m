//
//  DarenTableViewCell.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "DarenTableViewCell.h"
@interface DarenTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end
@implementation DarenTableViewCell

-(void)setDarenModel:(DarenModel *)darenModel{
    _darenModel =darenModel;
    
    NSURL * urlB =[NSURL URLWithString:@"http://img5.shougongke.com//Public/data/mobel/bg/000/83/91/t839135.jpg?ckey=0754a"];
        [self.backImageView setImageWithURL:urlB];

    NSURL * url =[NSURL URLWithString:darenModel.avatar];
    [self.headImageView setImageWithURL:url];
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 25;
       self.nameLabel.text = darenModel.uname;
     self.adressLabel.text = darenModel.region;
    NSString *message = [NSString stringWithFormat:@"教程%@.粉丝%@.手工圈%@",darenModel.coursecollect,darenModel.fen_num,darenModel.circle_count];

    self.messageLabel.text = message;
}

+(id)darenCellWithTableView:(UITableView *)tableView
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
