//
//  CourseTableViewCell.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"
@interface CourseTableViewCell : UITableViewCell
@property (nonatomic,strong)NSMutableArray *courseArray;
+(id)courseCellWithTableView:(UITableView *)tableView;
@end
