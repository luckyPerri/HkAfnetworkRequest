//
//  ViewController.m
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 2017/2/16.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import "ViewController.h"
#import "GTNetWorkConfigInfo.h"
#import "GTNetWorkRequestGeneretor.h"

@interface ViewController ()

@property (nonatomic , strong)UILabel* showLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* testBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    lab.text = @"test";
    self.showLab = lab;
    lab.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lab];
}

-(void)test:(id)sender{
    
    NSDictionary* requestDic = [NSMutableDictionary dictionary];
    
    GTNetWorkConfigInfo* configInfo = [GTNetWorkConfigInfo configInfoWithServiceType:GTServiceTypex requestType:GTRequestTypeGet urlPath:@"" isHttps:NO baseParams:nil requestParams:requestDic];
    NSMutableURLRequest* request = [GTNetWorkRequestGeneretor generateRequestWithConfigInfo:configInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
