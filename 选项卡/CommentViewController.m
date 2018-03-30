//
//  CommentViewController.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/12.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "CommentViewController.h"
#import "TOPCell.h"
#import "MessageCell.h"
#import "MyReceiveUPMessageViewController.h"
#import "NoTiceView.h"

#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NoTiceView *_noticeView;
}


@property (nonatomic,strong)UITableView *tablev;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor greenColor];

    NSLog(@"评论和赞");
    _tablev = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tablev registerClass:[TOPCell class] forCellReuseIdentifier:@"TOP"];
    [_tablev registerClass:[MessageCell class] forCellReuseIdentifier:@"CELL"];
    _tablev.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tablev.delegate = self;
    _tablev.dataSource = self;
    _noticeView = [[NoTiceView alloc]initWithFrame:CGRectMake(0, 230, self.view.bounds.size.width, 160) withImage:@"default_message" withTitle:@"暂无新评论"];
    [_tablev addSubview:_noticeView];
    _noticeView.hidden = NO;

    [self.view addSubview:_tablev];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 72*height_per;
    }else{
        return 72*height_per;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TOPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOP" forIndexPath:indexPath];
        cell.reciveLable.text = @"1条新的赞";
        return cell;
    }else{
        MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
        cell.messageLable.text = @"fsdfsdfsdfs";
        cell.timeLabel.text = @"3-21 13:40";
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    if (indexPath.section == 0) {
        MyReceiveUPMessageViewController *mys = [[MyReceiveUPMessageViewController alloc]init];
        [self.navigationController pushViewController:mys animated:YES];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"评论和赞---viewwillapper");

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
