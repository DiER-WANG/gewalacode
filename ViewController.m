//
//  ViewController.m
//  gewalacode
//
//  Created by wangchangyang on 16/3/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"
#import "DWNavigationControllerDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
 
    [self.view addSubview:pushBtn];

    _pushBtn = pushBtn;
    
    [pushBtn setBackgroundColor:[UIColor greenColor]];
    
    [pushBtn addTarget:self action:@selector(pushBtnMethod) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushBtnMethod {

    __strong id strongDelegate = (id)[DWNavigationControllerDelegate new];
    
    self.navigationController.delegate = strongDelegate;
    
    [self.navigationController pushViewController:[[OtherViewController alloc] init] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
