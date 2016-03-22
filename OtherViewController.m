//
//  OtherViewController.m
//  gewalacode
//
//  Created by wangchangyang on 16/3/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "OtherViewController.h"
#import "DWNavigationControllerDelegate.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *popBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [self.view addSubview:popBtn];
    
    _popBtn = popBtn;
    
    [popBtn setBackgroundColor:[UIColor greenColor]];
    
    [popBtn addTarget:self action:@selector(popBtnMethod) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popBtnMethod {
    __strong id strongDelegate = (id)[DWNavigationControllerDelegate new];

    self.navigationController.delegate = strongDelegate;

    [self.navigationController popViewControllerAnimated:YES];
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
