//
//  MyReceiveUPMessageViewController.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/15.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "MyReceiveUPMessageViewController.h"
#import "MessageCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@interface MyReceiveUPMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *topNavView;
@property (nonatomic,strong)UIButton *backBT;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *lineLabel;

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *dataARR;

@end

@implementation MyReceiveUPMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataARR = [[NSMutableArray alloc]init];
    [self.view addSubview:self.topNavView];
    
    [self.view addSubview:self.tableview];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72*height_per;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.messageLable.text = @"fsdfsdfsdfs";
    cell.timeLabel.text = @"3-21 13:40";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
- (void)backToMine
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        [_tableview registerClass:[MessageCell class] forCellReuseIdentifier:@"CELL"];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
- (UIView *)topNavView
{
    if (!_topNavView) {
        _topNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
        _topNavView.backgroundColor = [UIColor whiteColor];
        [_topNavView addSubview:self.backBT];
        [_topNavView addSubview:self.titleLabel];
        [_topNavView addSubview:self.lineLabel];
        self.titleLabel.text = @"你收到的赞";
    }
    return _topNavView;
}

- (UIButton *)backBT
{
    if (!_backBT) {
        _backBT = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [_backBT setImageEdgeInsets:UIEdgeInsetsMake(0, -20*SCREEN_RATIO, 0, 10)];//距离上 左 下 右的距离 这里相对于系统的位置靠左20像素 很直观的
        _backBT.frame = CGRectMake(0, 20, 44, 44);
        [_backBT addTarget:self action:@selector(backToMine) forControlEvents:UIControlEventTouchUpInside];
        [_backBT setImage:[UIImage imageNamed:@"nav_menu_back01"] forState:UIControlStateNormal];
    }
    return _backBT;
}
- (UILabel *)titleLabel
{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, ScreenWidth-100, 44)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        _titleLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
    }
    return _titleLabel;
}
- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 63.5, ScreenWidth, 0.5)];
        _lineLabel.backgroundColor =[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        _lineLabel.alpha = 0.5;
    }
    return _lineLabel;
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
