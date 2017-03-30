//
//  CustomInteractionController.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/17.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "CustomInteractionController.h"

@implementation CustomInteractionController

- (void)attrachToViewController:(UIViewController*)viewController{
    _navigationController = viewController.navigationController;
    
}

- (void)setupGestureRecognizer:(UIView*)view{
    UIPanGestureRecognizer *panGuseture  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [view addGestureRecognizer:panGuseture];
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)gestureRecognizer{
    CGPoint viewTranslation = [gestureRecognizer translationInView:gestureRecognizer.view ];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
        }
        case UIGestureRecognizerStateCancelled :
        {
            
        }
        case UIGestureRecognizerStateEnded :
        {
            
        }

            
        default:
            break;
    }
}
@end
