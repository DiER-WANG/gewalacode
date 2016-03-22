//
//  DWTransitionAnimator.m
//  gewalacode
//
//  Created by wangchangyang on 16/3/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "DWTransitionAnimator.h"
#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "OtherViewController.h"


@interface DWTransitionAnimator()<UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id transitionContext;

@end

@implementation DWTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    _transitionContext = transitionContext;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    UIButton *pushBtn = nil;
    
    if ([fromVC isKindOfClass:[ViewController class]]) {
        
        pushBtn = [(ViewController *)fromVC pushBtn];
        
    } else if ([fromVC isKindOfClass:[OtherViewController class]]) {
        
        pushBtn = [(OtherViewController *)fromVC popBtn];
    }
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:pushBtn.frame];
    
    float radious = sqrtf(powf(pushBtn.center.x - CGRectGetWidth(toVC.view.frame), 2) + powf(pushBtn.center.y - CGRectGetHeight(toVC.view.frame), 2));
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(pushBtn.frame, -radious, -radious)];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endPath.CGPath;

    toVC.view.layer.mask = maskLayer;
    
    
    CABasicAnimation *layerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    layerAnimation.delegate = self;
    layerAnimation.duration = [self transitionDuration:transitionContext];
    
    layerAnimation.fromValue = (__bridge id _Nullable)(startPath.CGPath);
    layerAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    
    
    [maskLayer addAnimation:layerAnimation forKey:@"suibianxie"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [_transitionContext completeTransition:![_transitionContext transitionWasCancelled]];
//    [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
