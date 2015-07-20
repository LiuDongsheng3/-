//
//  FirstView.m
//  手工客
//
//  Created by qianfeng on 15-7-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "FirstView.h"
#import "Slide.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "Nav.h"
#import "Adv.h"
#import "ClasssTableViewCell.h"
#import "ClasssModel.h"
#import "ProductsTableViewCell.h"
#import "ProductsModel.h"
#import "DarenModel.h"
#import "DarenTableViewCell.h"
#import "TopicTableViewCell.h"
#import "TopicModel.h"
#import "CourseModel.h"
#import "CourseTableViewCell.h"
@interface FirstView()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    
}

@property(nonatomic,weak)UIView * headView;
@property (weak, nonatomic)  UIScrollView *headScrollView;
@property (weak, nonatomic)  UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,assign)CGPoint  tableViewPoint;


@end
@implementation FirstView


-(void)setSlideArr:(NSMutableArray *)slideArr
{
    _slideArr = slideArr;
    
    //得到数据后，创建UIScrollView
    [self createHeadScrollView];
    //创建之后加监听器
    [self createScrollTimer];
   
    
}
-(void)createHeadScrollView{
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    UIView * scView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainFrame.size.width, 300)];
    self.headView = scView;
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    
    _headScrollView=scrollView;
    
    _headScrollView.frame = CGRectMake(0, 0,mainFrame.size.width, 300-180);
    
    _headScrollView.contentSize = CGSizeMake(_slideArr.count * mainFrame.size.width,0);
    //设置滚动内容
    
    for (int i = 0; i<_slideArr.count; i++) {
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i* mainFrame.size.width, 0,  mainFrame.size.width, 300-180)];
        //赋值图片
        [imageView setImageWithURL:[NSURL URLWithString:_slideArr[i]]];
        //imageView.image = [UIImage imageNamed:@"personalpage_bg"];
        
        imageView.userInteractionEnabled = YES;
        
        [_headScrollView addSubview:imageView];
    }
    
    _headScrollView.showsHorizontalScrollIndicator = NO;
    _headScrollView.showsVerticalScrollIndicator = NO;
    _headScrollView.bounces = YES;
    _headScrollView.pagingEnabled = YES;
    _headScrollView.delegate = self;
    
    
    //添加滚动视图
    
    [_headView addSubview:_headScrollView];
    

    //添加页码条
    
    UIPageControl *p = [[UIPageControl alloc]init];
    _pageControl = p;
    
    _pageControl.frame = CGRectMake(150, 70, 80, 50);
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    _pageControl.userInteractionEnabled = YES;
    _pageControl.numberOfPages =_slideArr.count;
    [_headView addSubview:_pageControl];

     _tableView.tableHeaderView = _headView;
    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(0, 1040, 375, 30);
//    button.titleLabel.text =@"ssss";
//     _tableView.tableFooterView = button;
}

-(void)setNavArr:(NSMutableArray *)navArr
{
    _navArr = navArr;
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    //达人一列
    for (int i = 0; i<_navArr.count; i++) {
        
        UIView * secView =[[UIView alloc]initWithFrame:CGRectMake(i*mainFrame.size.width/_navArr.count, 120, mainFrame.size.width/_navArr.count, 100)];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        //赋值图片
        Nav * nav = _navArr[i];
        [imageView setImageWithURL:[NSURL URLWithString:nav.host_pic]];
        
        //        UIImage * image = imageView.image;
        imageView.center = CGPointMake(secView.frame.size.width/2, (100-20)/2);
        UILabel * seclabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100-20, secView.frame.size.width, 20)];
        
        
        seclabel.text = nav.subject;
        seclabel.textAlignment = NSTextAlignmentCenter;
        seclabel.font = [UIFont systemFontOfSize:12];
        secView.userInteractionEnabled=YES;
        
        [secView addSubview:seclabel];
        [secView addSubview:imageView];
        
        
        [_headView addSubview:secView];
        
        
    }
    
}

-(void)setAdvArr:(NSMutableArray *)advArr{
    //闪购一列
    _advArr = advArr;
    CGRect  mainFrame = [UIScreen mainScreen].bounds;

    for (int i = 0; i<advArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*mainFrame.size.width/_advArr.count, 220 , mainFrame.size.width/_advArr.count, 80)];
        
        Adv *adv = _advArr[i];
        
        [imageView setImageWithURL:[NSURL URLWithString:adv.ad_img]];
        imageView.userInteractionEnabled = YES;
        
        CALayer *layer = [imageView layer];
        layer.borderColor = [UIColor colorWithRed:0.01 green:0.01 blue:0.01 alpha:0.2].CGColor;
        layer.borderWidth = 0.5f;
        
        [_headView addSubview:imageView];
        
    }
    
    
}


//创建自动滚动
-(void)createScrollTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

-(void)timerAction:(NSTimer *)time
{
    //定时器
    if (_headScrollView.contentOffset.x<375.0f*7) {
        CGFloat x = _headScrollView.contentOffset.x +375.0f;
        _headScrollView.contentOffset = CGPointMake(x, _headScrollView.contentOffset.y);
    }
    else
    {
        _headScrollView.contentOffset = CGPointMake(0, 0);
    }
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    _pageControl.currentPage =_headScrollView.contentOffset.x /(mainFrame.size.width);
}

-(void)setDataSourceTableView:(NSMutableArray *)dataSourceTableView
{
    _dataSourceTableView = dataSourceTableView;
    [_tableView reloadData];

}
#pragma mark table的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  _dataSourceTableView.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arr =  [_dataSourceTableView objectAtIndex:section];

    if (section == 0) {
        return 1;
    }else if (section == 1)
    {
        return 1;
        
    }else if(section == 2)
    {
        return 1;
        
    }else if (section == 3)
    {
        return 1;
    }else if (section == 4)
    {
        return 1;
    }else{
        return 1;
    }


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 270;
    }else if (indexPath.section == 1)
    {
        return 210;
        
    }else if(indexPath.section == 2)
    {
        return 200;
    }else if (indexPath.section == 3)
    {
        return 360;
    }else if (indexPath.section == 4)
    {
        return 1900;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 3) {
        
        TopicTableViewCell * topicCell = [TopicTableViewCell topicCellWithTableView:tableView];
        topicCell.topicArray = [self.dataSourceTableView objectAtIndex:indexPath.section];
        
        return topicCell;
    }else if (indexPath.section == 1)
    {
        ProductsTableViewCell * productsCell = [ProductsTableViewCell productsCellWithTableView:tableView];
        productsCell.productsModel = [[self.dataSourceTableView objectAtIndex:indexPath.section] objectAtIndex:1];//第1条数据没有图片地址，所以选择第二条
        return productsCell;
        
    }else if(indexPath.section == 2)
    {
        DarenTableViewCell * darenCell = [DarenTableViewCell darenCellWithTableView:tableView];
        darenCell.darenModel = [[self.dataSourceTableView objectAtIndex:indexPath.section] objectAtIndex:0];
        return darenCell;
    }else if (indexPath.section == 0)
    {
        
        ClasssTableViewCell * classsCell = [ClasssTableViewCell classsCellWithTableView:tableView];
        classsCell.classArray = [self.dataSourceTableView objectAtIndex:indexPath.section];
        return classsCell;

        
    }else if (indexPath.section == 4)
    {
        CourseTableViewCell * courseCell  = [CourseTableViewCell courseCellWithTableView:tableView];
        courseCell.courseArray = [self.dataSourceTableView objectAtIndex:indexPath.section];
        
        return courseCell;
    }
    return nil;
}


@end
