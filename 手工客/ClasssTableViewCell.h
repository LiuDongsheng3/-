//
//  ClasssTableViewCell.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClasssModel.h"
@interface ClasssTableViewCell : UITableViewCell
@property (nonatomic,strong)NSMutableArray * classArray;
+(id)classsCellWithTableView:(UITableView *)tableView;
@end
