//
//  ProductsTableViewCell.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsModel.h"
@interface ProductsTableViewCell : UITableViewCell
@property (nonatomic,strong)ProductsModel * productsModel;
+(id)productsCellWithTableView:(UITableView *)tableView;
@end
