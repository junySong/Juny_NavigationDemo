//
//  NLTransitionAnimation.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/17.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "NLTransitionAnimation.h"
#import "UIViewController+NavExtension.h"
@implementation NLTransitionAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    // For a Presentation:
    //      fromView = The presenting view.
    //      toView   = The presented view.
    // For a Dismissal:
    //      fromView = The presented view.
    //      toView   = The presenting view.
    UIView *fromView;
    UIView *toView;
    
    // In iOS 8, the viewForKey: method was introduced to get views that the
    // animator manipulates.  This method should be preferred over accessing
    // the view of the fromViewController/toViewController directly.
    // It may return nil whenever the animator should not touch the view
    // (based on the presentation style of the incoming view controller).
    // It may also return a different view for the animator to animate.
    //
    // Imagine that you are implementing a presentation similar to form sheet.
    // In this case you would want to add some shadow or decoration around the
    // presented view controller's view. The animator will animate the
    // decoration view instead and the presented view controller's view will
    // be a child of the decoration view.
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    
    // We are responsible for adding the incoming view to the containerView
    // for the presentation/dismissal.
    [containerView addSubview:toView];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    CGRect fromsize = fromView.frame;
    CGRect tosize = toView.frame;
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
   
    [fromViewController changeNavBarBgAlpha:(fromView.frame.origin.x/(weight-1))];
    
//    [UIView animateWithDuration:transitionDuration animations:^{
//      
//     
//    } completion:^(BOOL finished) {
//        fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
//        BOOL wasCancelled = [transitionContext transitionWasCancelled];
//        [transitionContext completeTransition:!wasCancelled];
//    }];
}
@end
