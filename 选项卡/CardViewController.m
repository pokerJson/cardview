//
//  CardViewController.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/12.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "CardViewController.h"
#import "CYAX_SelectView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@interface CardViewController ()<CYAX_SelectViewDelegate>

//当前
@property (nonatomic,assign)NSInteger currentPage;
//存数据 放uiviewcontroller
@property (nonatomic,strong)NSMutableArray *childControllers;

@property (nonatomic, strong) CYAX_SelectView *CYAX_SelectView;

@end

@implementation CardViewController

//初试
- (id)init
{
    if (self == [super init]) {
        self.childControllers = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    [self creatUI];
}
#pragma mark 创建部分UI
- (void)creatUI
{
    [self.view addSubview:self.CYAX_SelectView];
    NSArray *vcARR = @[@"CommentViewController",@"SystemNoticeViewController"];
    [self creatChildViewControllersWithvcArr:vcARR];
    
}
- (void)creatChildViewControllersWithvcArr:(NSArray *)vcARR
{
    for (NSInteger i = 0; i < vcARR.count; i++) {
        NSString * className = [NSString stringWithFormat:@"%@",vcARR[i]];
        
        Class myClass = NSClassFromString(className);
        UIViewController * VC = [[myClass alloc]init];
        //将子控制器加入到self里
        [self addChildViewController:VC];
        [self.childControllers addObject:VC];
        //  默认,加载第一个视图
        [self addSubViewWithCurrentPage:0];
        self.currentPage = 0;
    }

}
//  切换各个标签内容
-(void)addSubViewWithCurrentPage:(NSInteger)currentPage
{
    if (self.childControllers.count > currentPage) {
        UIView *currentView = [self.childControllers[currentPage] view];
        if (currentView.superview == nil) {
            CGFloat width = self.CYAX_SelectView.bgScrollView.bounds.size.width;
            CGFloat height = self.CYAX_SelectView.bgScrollView.bounds.size.height;
            
            currentView.frame = CGRectMake(width * currentPage, 0, width, height-64);
            [self.CYAX_SelectView.bgScrollView addSubview:currentView];
        }
    }
}
#pragma mark --CYAX_SelectViewdelegate
-(void)CYAX_SelectView:(CYAX_SelectView *)selectView moveTableView_or_CollectionVWithTag:(NSInteger)tag
{
    NSLog(@"按钮选择==%ld",self.currentPage);
    //  点击处于当前页面的按钮,直接跳出
    if (self.currentPage == tag) {
        return;
    }
    [self.CYAX_SelectView.bgScrollView setContentOffset:CGPointMake(tag * ScreenWidth, 0) animated:YES];
    
    [self addSubViewWithCurrentPage:tag];
    self.currentPage = tag;
    
}
//拖动CYAX_SelectView的代理
-(void)CYAX_SelectViewWhenbottomScrollVDidEndDecelerating
{
    self.currentPage = self.CYAX_SelectView.bgScrollView.contentOffset.x / self.CYAX_SelectView.bgScrollView.frame.size.width;
    //加载subView
    [self addSubViewWithCurrentPage:self.currentPage];
    
}

-(CYAX_SelectView *)CYAX_SelectView
{
    if (!_CYAX_SelectView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _CYAX_SelectView = [[CYAX_SelectView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight-20 )];
        _CYAX_SelectView.delegate = self;
        NSArray *tabNameArrM = [NSArray array];
        tabNameArrM = @[@"评论和赞",@"系统通知"];
//        for (NSInteger i = 0; i < 2; i++) {
//            NSString *tabName = [NSString stringWithFormat:@"评论和赞"];
//            [tabNameArrM addObject:tabName];
//            
//        }
        [_CYAX_SelectView setTopStatusButtonWithTitles:tabNameArrM NormalColor:[UIColor colorWithRed:128/255.0 green:131/255.0 blue:135/255.0 alpha:1] SelectedColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1] LineColor:[UIColor redColor]];
    }
    return _CYAX_SelectView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
