//
//  UINavigationController+Juny.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/29.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "UINavigationController+Juny.h"

@implementation UINavigationController (Juny)

+ (void)initialize{
 
    //方法交换
    SEL sel1 = NSSelectorFromString(@"_updateInteractiveTransition:");
    SEL et_sel1 = NSSelectorFromString(@"et_updateInteractiveTransition:");
    Method originalMethod1 = class_getInstanceMethod(self.classForCoder, sel1);
    Method swizzledMethod1 = class_getInstanceMethod(self.classForCoder, et_sel1);
    method_exchangeImplementations(originalMethod1, swizzledMethod1);
    
    //
    SEL  sel2 = @selector(popToViewController:animated:);
    SEL  et_sel2 = @selector(et_popToViewController:animation:);
    Method originalMethod2= class_getInstanceMethod(self.classForCoder, sel2);
    Method swizzledMethod2 = class_getInstanceMethod(self.classForCoder, et_sel2);
    method_exchangeImplementations(originalMethod2, swizzledMethod2);
    //
    SEL sel3 = @selector(popToRootViewControllerAnimated:);
    SEL et_sel3 = @selector(et_popToRootViewController:);
    Method originalMethod3= class_getInstanceMethod(self.classForCoder, sel3);
    Method swizzledMethod3 = class_getInstanceMethod(self.classForCoder, et_sel3);
    method_exchangeImplementations(originalMethod3, swizzledMethod3);
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
//    self.navigationController.navigationBar.delegate = self;
}

- (void)et_updateInteractiveTransition:(CGFloat)percentComplete{
    [self et_updateInteractiveTransition:percentComplete];
    UIViewController *topVC = self.topViewController;
    if (topVC) {
        id<UIViewControllerTransitionCoordinator> coor = topVC.transitionCoordinator;
        if (coor) {
            CGFloat fromAlpha = [[[coor viewControllerForKey:UITransitionContextFromViewControllerKey] navBarBgAlpha] floatValue];
            CGFloat toAlpha = [[[coor viewControllerForKey:UITransitionContextToViewControllerKey] navBarBgAlpha] floatValue];
            CGFloat nowAlpha = fromAlpha + (toAlpha-fromAlpha)*percentComplete;
            [self setNeedsNavigationBackground:nowAlpha];
            
            
        }
    }
}

- (UIViewController *) et_popToViewController:(UIViewController*)viewController animation:(BOOL)animation{
    [self setNeedsNavigationBackground:[viewController.navBarBgAlpha floatValue]];
    return [self et_popToViewController:viewController animation:animation];
}

- (UIViewController*)et_popToRootViewController:(BOOL)animation{
    UIViewController *rootvc= self.viewControllers.firstObject;
    [self setNeedsNavigationBackground:[rootvc.navBarBgAlpha floatValue]];
    return [self et_popToRootViewController:animation];
}
#pragma mark------------------delegate----------------------
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *topVC = navigationController.topViewController;
    if (topVC) {
      id  <UIViewControllerTransitionCoordinator>coor = topVC.transitionCoordinator;
        if (coor) {
            [coor notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                [self dealInteractionChanges:context];
            }];
        }
        
        
       
    }
}

- (void)dealInteractionChanges:(id<UIViewControllerTransitionCoordinatorContext> _Nonnull)  context{
    
    if ([context isCancelled]) {
        NSTimeInterval  cancellDuration = [context transitionDuration]*((double)[context percentComplete]);
        [UIView animateWithDuration:cancellDuration animations:^{
            
            UIViewController *fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
            CGFloat nowAlpha = [fromVC.navBarBgAlpha floatValue];
            [self setNeedsNavigationBackground:nowAlpha];
        }];
        
    }else{
        NSTimeInterval  finishDuration = [context transitionDuration]*((double)(1 - [context percentComplete]));
        [UIView animateWithDuration:finishDuration animations:^{
            
            UIViewController *toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
            CGFloat nowAlpha = [toVC.navBarBgAlpha floatValue];
            [self setNeedsNavigationBackground:nowAlpha];
        }];

    }
    
}



- (void)setNeedsNavigationBackground:(CGFloat)alpha{
    UIView *barBackgroundView = self.navigationBar.subviews[0];
    
    UIView *shadowView = [barBackgroundView valueForKey:@"_shadowView"];
    if (shadowView) {
        shadowView.alpha = alpha;
    }
    if ([self.navigationBar isTranslucent]) {
        barBackgroundView.alpha = alpha;
    }
}


- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    UIViewController *topVC = self.topViewController;
    if (topVC) {
        id <UIViewControllerTransitionCoordinator> coor = topVC.transitionCoordinator;
        if (coor.initiallyInteractive) {
            return YES;
        }
    }
    UIViewController *popToVC;
    if (self.viewControllers.count >= (navigationBar.items.count)) {
        popToVC = self.viewControllers[self.viewControllers.count-2];
    }else{
        popToVC = self.viewControllers[self.viewControllers.count-1];
    }
    if (popToVC != nil) {
        [self popToViewController:popToVC animated:YES];
        return YES;
    }
    return NO;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item{
    UIViewController *topVC = self.topViewController;
    [self setNeedsNavigationBackground:[topVC.navBarBgAlpha floatValue]];
    return YES;
}


#pragma mark------------------setter/getter----------------------

- (UIColor*)defaultNavBarTintColor{
    return [UIColor colorWithRed:0 green:0.47843 blue:1 alpha:1];
}



@end
