//
//  ContentView.m
//  手工客
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ContentView.h"
#import "Slide.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "Nav.h"
#import "Adv.h"
#import "FirstView.h"
#import "ClasssModel.h"
#import "ProductsModel.h"
#import "DarenModel.h"
#import "TopicModel.h"
#import "CourseModel.h"
@interface ContentView()<UIScrollViewDelegate,ScrollViewDeleceratingProtocol>
{


}

//@property (weak, nonatomic)  UIScrollView *globScrollView;//全局滚动
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UIButton *handPinkBtn;
@property (weak, nonatomic) IBOutlet UIButton *trendsBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *menuScrollView;
@property (weak, nonatomic) IBOutlet FirstView *contentViewFirstTable;
@end
@implementation ContentView
-(void)createContent{
    [self createMenuScrollView];
    [self getData];
    self.contentViewFirstTable.delegate = self;

}
-(void)createMenuScrollView
{
 //   self.automaticallyAdjustsScrollViewInsets = NO;
    
    _menuScrollView.delegate = self;
    _menuScrollView.userInteractionEnabled = YES;
    _menuScrollView.showsHorizontalScrollIndicator = NO;
    _menuScrollView.bounces = NO;
    _menuScrollView.contentSize = CGSizeMake(2*375, 510);
    _menuScrollView.pagingEnabled = YES;
    [self addSubview:_menuScrollView];
}

- (IBAction)handPinkTocuh:(UIButton *)sender {
    
     _menuScrollView.contentOffset = CGPointMake(0, 0);
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    CGRect rect = CGRectMake(10,_lineImageView.frame.origin.y , mainFrame.size.width/2-20, 2);
    _lineImageView.frame = rect;
    
    [_trendsBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [_handPinkBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

}
- (IBAction)trendsTocuh:(UIButton *)sender {
    _menuScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    CGRect rect = CGRectMake(mainFrame.size.width/2+10,_lineImageView.frame.origin.y , mainFrame.size.width/2-20, 2);
    _lineImageView.frame = rect;
    
    [_handPinkBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [_trendsBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
}


-(void)getData{

 
    NSString *urlString = @"http://m.shougongke.com/index.php?&c=index&a=indexnew&vid=9&";
    
    NSLog(@"urlString = %@",urlString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        // NSLog(@"dict = %@",dict);
        
        NSDictionary *dictData = [dict objectForKey:@"data"];
        
        
//滚动视图数据
        NSMutableArray *slideObjs = [[NSMutableArray alloc] init];
        NSArray *arr = [dictData objectForKey:@"slide"];
        for (NSDictionary *appDict in arr) {
            
            //创建数据模型对象,加入数据数组
            
            Slide *slide = [Slide appWithDict:appDict];
            
            [slideObjs addObject:slide.host_pic];
        }
        

        self.contentViewFirstTable.slideArr = slideObjs;
        
        
//达人数据
        NSMutableArray *navObjs = [[NSMutableArray alloc] init];
        NSArray *navArr = [dictData objectForKey:@"nav"];
        for (NSDictionary *appDict in navArr) {
            
            //创建数据模型对象,加入数据数组
            
            Nav *nav = [Nav appWithDict:appDict];
            
            [navObjs addObject:nav];
        }
        

        self.contentViewFirstTable.navArr = navObjs;
        
//闪购数据
        NSMutableArray *advObjs = [[NSMutableArray alloc]init];
        NSArray *advArr = [dictData objectForKey:@"adv"];
        for (NSDictionary *appDict in advArr) {
        
            Adv *adv = [Adv advWithDict:appDict];
            [advObjs addObject:adv];
        }

        self.contentViewFirstTable.advArr = advObjs;
        
        
//获取其他五组tableView内容
        NSArray * arr1 = [dictData objectForKey:@"classs"];
        NSArray * arr2 = [dictData objectForKey:@"products"];
        NSDictionary * arr3 = [dictData objectForKey:@"daren"];
        NSArray * arr4 = [dictData objectForKey:@"topic"];
        NSArray * arr5 = [dictData objectForKey:@"course"];
        
        //        创建一个新的数组放五个数组
        NSMutableArray * arrTableViewDataSource = [[NSMutableArray alloc]init];
        
        NSMutableArray *tmpDataTable1 = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arr1) {
            ClasssModel * model = [ClasssModel classsWithDict:dict];
            [tmpDataTable1 addObject:model];
        }
        [arrTableViewDataSource addObject:tmpDataTable1];
        
        
        NSMutableArray *tmpDataTable2 = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in arr2) {
            ProductsModel * model = [ProductsModel productsWithDict:dict];
            [tmpDataTable2 addObject:model];
        }
        [arrTableViewDataSource addObject:tmpDataTable2];
        
        
        //  达人
        NSMutableArray *tmpDataTable3 = [[NSMutableArray alloc] init];
        DarenModel * model = [DarenModel darenWithDict:arr3];
        [tmpDataTable3 addObject:model];
        
        [arrTableViewDataSource addObject:tmpDataTable3];
        
        
        NSMutableArray *tmpDataTable4 = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arr4) {
            TopicModel * model = [TopicModel topicWithDict:dict];
            [tmpDataTable4 addObject:model];
        }
        [arrTableViewDataSource addObject:tmpDataTable4];
        
        NSMutableArray *tmpDataTable5 = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in arr5) {
            CourseModel * model = [CourseModel courseWithDict:dict];
            [tmpDataTable5 addObject:model];
        }
        
        [arrTableViewDataSource addObject:tmpDataTable5];
        
        
        self.contentViewFirstTable.dataSourceTableView = arrTableViewDataSource;
        


        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}



//实现协议方法，设置button和下面线的颜色
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGRect  mainFrame = [UIScreen mainScreen].bounds;
    NSInteger index = scrollView.contentOffset.x/mainFrame.size.width;
    if(index == 0){
        
        CGRect rect = CGRectMake(10,_lineImageView.frame.origin.y , mainFrame.size.width/2-20, 2);
        _lineImageView.frame = rect;
        
        [_trendsBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [_handPinkBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }else{
        CGRect  mainFrame = [UIScreen mainScreen].bounds;
        CGRect rect = CGRectMake(mainFrame.size.width/2+10,_lineImageView.frame.origin.y , mainFrame.size.width/2-20, 2);
        _lineImageView.frame = rect;
        
        [_handPinkBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [_trendsBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}


@end
