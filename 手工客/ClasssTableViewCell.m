//
//  ClasssTableViewCell.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ClasssTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@interface ClasssTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *twoImageView;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *threeImageView;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fourImageView;
@property (weak, nonatomic) IBOutlet UILabel *fourLabel;

@end
@implementation ClasssTableViewCell

-(void)setClassArray:(NSMutableArray *)classArray
{
    _classArray = classArray;
    // 第一个图
   ClasssModel * modelOne = [_classArray objectAtIndex:0];
    NSURL * url1 =[NSURL URLWithString:modelOne.host_pic];
    [self.oneImageView setImageWithURL:url1];
    self.oneLabel.text = modelOne.subject;
//    self.oneLabel.numberOfLines = 0;
//    self.oneLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    //第二个图
    ClasssModel * modelTwo = [_classArray objectAtIndex:1];
    NSURL * url2 =[NSURL URLWithString:modelTwo.host_pic];
    [self.twoImageView setImageWithURL:url2];
     self.oneLabel.numberOfLines = 0;
    self.twoLabel.text = modelTwo.subject;
    
    
    //第3个图
    ClasssModel * modelThree = [_classArray objectAtIndex:2];
    NSURL * url3 =[NSURL URLWithString:modelThree.host_pic];
    [self.threeImageView setImageWithURL:url3];
     self.oneLabel.numberOfLines = 0;
    self.threeLabel.text = modelThree.subject;
    
    //第4个图
    ClasssModel * modelFour = [_classArray objectAtIndex:3];
    NSURL * url4 =[NSURL URLWithString:modelFour.host_pic];
    [self.fourImageView setImageWithURL:url4];
     self.oneLabel.numberOfLines = 0;
    self.fourLabel.text = modelFour.subject;
}


+(id)classsCellWithTableView:(UITableView *)tableView
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
