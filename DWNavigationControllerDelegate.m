//
//  DWNavigationControllerDelegate.m
//  gewalacode
//
//  Created by wangchangyang on 16/3/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "DWNavigationControllerDelegate.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DWTransitionAnimator.h"

@interface DWNavigationControllerDelegate()<UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL interactive;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation DWNavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    return (id)[DWTransitionAnimator new];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return _interactive ? self.interactiveTransition : nil;
}

- (UIPercentDrivenInteractiveTransition *)interactiveTransition {
    
    if (!_interactiveTransition) {
        
        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    
    return _interactiveTransition;
}

@end
