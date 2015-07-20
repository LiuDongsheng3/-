//
//  TopicTableViewCell.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
@interface TopicTableViewCell : UITableViewCell
@property (nonatomic,strong)NSMutableArray * topicArray;
+(id)topicCellWithTableView:(UITableView *)tableView;
@end
