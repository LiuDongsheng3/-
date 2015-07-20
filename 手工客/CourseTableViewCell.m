//
//  CourseTableViewCell.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "CourseTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation CourseTableViewCell
-(void)setCourseArray:(NSMutableArray *)courseArray
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, 68, 21)];
    label.text = @"热门教程";
    label.font = [UIFont boldSystemFontOfSize:14];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(343 , 10, 20, 14);
    imageView.image = [UIImage imageNamed:@"ws_homepage_arrow"];
    
    [self.contentView addSubview:label];
    [self.contentView addSubview:imageView];
    
    
    //创建一个视图放所有的遍历视图
    
    UIView * viewBig = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, self.contentView.frame.size.height)];
    
    [self.contentView addSubview:viewBig];
    _courseArray = courseArray;
    //创建cell
    CGFloat padding = 10.0f;
    for (int i = 0; i<_courseArray.count; i++) {
        CourseModel * model = [_courseArray objectAtIndex:i];
        
        int row = i/2;
        int col = i%2;
        CGFloat viewWidth = (375-30)/2;
        CGFloat viewHigth = 150;
        CGFloat x = padding + col * (viewWidth+padding);
        CGFloat y = padding + row * (viewHigth + padding);
        UIView *  view  = [[UIView alloc]init];
        view.frame = CGRectMake(x, y, viewWidth, viewHigth);
        
        //设置大图的图片
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(0, 0, view.frame.size.width, 120);
        [imageView setImageWithURL:[NSURL URLWithString:model.host_pic]];
        //name
        UILabel * nameLable = [[UILabel alloc]init];
        nameLable.frame = CGRectMake(0, 125, view.frame.size.width, 8);
        nameLable.text = model.subject;
        nameLable.font = [UIFont systemFontOfSize:12];
        nameLable.textAlignment = NSTextAlignmentLeft;
        
        UIImageView * iconUiimageView = [[UIImageView alloc]init];
        iconUiimageView.frame = CGRectMake(0, 145, view.frame.size.width*0.1, 13);
        [iconUiimageView setImageWithURL:[NSURL URLWithString:model.avatar]];
        
        UIImageView * darenUiimageView = [[UIImageView alloc]init];
        iconUiimageView.layer.masksToBounds = YES;
        iconUiimageView.layer.cornerRadius = iconUiimageView.frame.size.width/2;
        if ([model.is_daren isEqualToString:@"1"]) {
            darenUiimageView.frame = CGRectMake(iconUiimageView.frame.size.width+4, 145, view.frame.size.width*0.1, 13);
            darenUiimageView.image = [UIImage imageNamed:@"userIdentifer"];
        }else
        {
            darenUiimageView.frame = CGRectMake(view.frame.size.width*0.1, 145, 0, 0);
        }
        
        UILabel * labelUName = [[UILabel alloc]init];
        labelUName.frame = CGRectMake(CGRectGetMaxX(darenUiimageView.frame)+4, 145, view.frame.size.width*0.6, 10);
        labelUName.text = model.user_name;
        labelUName.font = [UIFont systemFontOfSize:13];
        
        
        [view addSubview:imageView];
        [view addSubview:nameLable];
        [view addSubview:iconUiimageView];
        [view addSubview:darenUiimageView];
        [view addSubview:labelUName];
   
        
        [viewBig addSubview:view];
        
    }
    
    
    
}






//+(id)courseCellWithTableView:(UITableView *)tableView
//{
//    NSString * Identifier = NSStringFromClass([self class]);
//    UINib * nib = [UINib nibWithNibName:Identifier bundle:nil];
//    [tableView registerNib:nib forCellReuseIdentifier:Identifier];
//
//    return [tableView dequeueReusableCellWithIdentifier:Identifier];
//
//}

+(id)courseCellWithTableView:(UITableView *)tableView
{
    NSString * Identifier = NSStringFromClass([self class]);
    CourseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[CourseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    NSLog(@"%@",cell);
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
