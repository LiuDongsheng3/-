//
//  TopicTableViewCell.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@interface TopicTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *firstOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstTwoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstThreeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstFourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstFiveImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstContentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *secondOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondTwoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondThreeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondFourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondFiveImageView;
@property (weak, nonatomic) IBOutlet UILabel *secondContentLabel;


@end
@implementation TopicTableViewCell

-(void)setTopicArray:(NSMutableArray *)topicArray
{
    _topicArray = topicArray;
    
    TopicModel * topicOne = [_topicArray objectAtIndex:0];
//五张图片的数组
    NSMutableArray * pics = topicOne.pic;
    [self.firstOneImageView setImageWithURL:[NSURL URLWithString:pics[0]]];
    [self.firstTwoImageView setImageWithURL:[NSURL URLWithString:pics[1]]];
    [self.firstThreeImageView setImageWithURL:[NSURL URLWithString:pics[2]]];
    [self.firstFourImageView setImageWithURL:[NSURL URLWithString:pics[3]]];
    [self.firstFiveImageView setImageWithURL:[NSURL URLWithString:pics[4]]];
    
    self.firstContentLabel.text = topicOne.subject;
    
    TopicModel * topicTwo = [_topicArray objectAtIndex:1];
    NSMutableArray * pict = topicTwo.pic;
    [self.secondOneImageView setImageWithURL:[NSURL URLWithString:pict[0]]];
    [self.secondTwoImageView setImageWithURL:[NSURL URLWithString:pict[1]]];
    [self.secondThreeImageView setImageWithURL:[NSURL URLWithString:pict[2]]];
    [self.secondFourImageView setImageWithURL:[NSURL URLWithString:pict[3]]];
    [self.secondFiveImageView setImageWithURL:[NSURL URLWithString:pict[4]]];
    
    self.secondContentLabel.text = topicTwo.subject;
    
}

+(id)topicCellWithTableView:(UITableView *)tableView
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
