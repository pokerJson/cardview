//
//  ViewController.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/12.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "ViewController.h"
#import "CardViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 100, 100, 40);
    [bt setTitle:@"点啊啊啊" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [bt addTarget:self action:@selector(dianji) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}
- (void)dianji
{
    NSLog(@"sss==");
    CardViewController *cad = [[CardViewController alloc]init];
    [self.navigationController pushViewController:cad animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
