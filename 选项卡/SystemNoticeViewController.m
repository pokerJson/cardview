//
//  SystemNoticeViewController.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/12.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "SystemNoticeViewController.h"
#import "NoTiceView.h"

#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@interface SystemNoticeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tablev;
    NoTiceView *_noticeView;

}

@end

@implementation SystemNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor yellowColor];
    NSLog(@"系统通知");
    _tablev = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tablev registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cc"];
    _tablev.delegate = self;
    _tablev.dataSource = self;
    _noticeView = [[NoTiceView alloc]initWithFrame:CGRectMake(0, 230, self.view.bounds.size.width, 160) withImage:@"default_message" withTitle:@"暂无新通知"];
    [_tablev addSubview:_noticeView];
    _noticeView.hidden = NO;

    [self.view addSubview:_tablev];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cc" forIndexPath:indexPath];
    cell.textLabel.text = @"eeeeee";
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"系统通知---viewwillapper");
    
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
