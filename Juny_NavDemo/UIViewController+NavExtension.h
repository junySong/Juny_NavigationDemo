//
//  UIViewController+NavExtension.h
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/16.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavExtension)
@property (nonatomic, assign) NSNumber *navBarBgAlpha;//背景色的透明


- (void)changeNavBarBgAlpha :(CGFloat)alpha;
@end
