//
//  FirstView.h
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstView;
@protocol ScrollViewDeleceratingProtocol<NSObject>
//向上滑动
-(void)changeNavigattionBarUPStatus:(FirstView *)view;
//向下滑动
-(void)changeNavigattionBarDOWNStatus:(FirstView *)view;
@end
@interface FirstView : UIView
@property (nonatomic,assign)id<ScrollViewDeleceratingProtocol> delegate;
//滚动视图的数据
@property (nonatomic,strong)NSMutableArray * slideArr;
/*
 四个按钮的属性
 */
//按钮的数据源
@property (nonatomic ,strong)NSMutableArray * navArr;
/*
 闪购 和 课堂的按钮
 */
@property (nonatomic,strong)NSMutableArray * advArr;

/*
 tableView的数据源
 */
@property (nonatomic,strong)NSMutableArray * dataSourceTableView;

@end
