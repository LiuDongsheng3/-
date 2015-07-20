//
//  DarenTableViewCell.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DarenModel.h"
@interface DarenTableViewCell : UITableViewCell
@property (nonatomic,strong)DarenModel * darenModel;
+(id)darenCellWithTableView:(UITableView *)tableView;
@end
