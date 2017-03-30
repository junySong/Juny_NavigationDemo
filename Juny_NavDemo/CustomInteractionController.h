//
//  CustomInteractionController.h
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/17.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomInteractionController : UIPercentDrivenInteractiveTransition
@property (nonatomic, strong) UINavigationController *navigationController;//
@property (nonatomic, assign) BOOL shouldCompleteTransition;//
@property (nonatomic, assign) BOOL transitionInProgress;//



@end
