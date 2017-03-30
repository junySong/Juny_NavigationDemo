//
//  UIViewController+NavExtension.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/16.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "UIViewController+NavExtension.h"

#import <objc/runtime.h>

static const void *NavBgAlphaKey = &NavBgAlphaKey;

@implementation UIViewController (NavExtension)

#pragma mark------------------Lifecycle----------------------


#pragma mark------------------setter/getter----------------------

/**
 返回背景的透明度，默认是1

 @return 背景透明度
 */
- (NSNumber *)navBarBgAlpha{
     NSNumber * alphaNumber= objc_getAssociatedObject(self, NavBgAlphaKey) ;
    return  alphaNumber = alphaNumber ? alphaNumber : @(1);
}


/**
 设置背景透明度，并且保证透明度的有效性，如果透明度在（0～1）

 @param navBarBgAlpha 背景透明度
 */
- (void)setNavBarBgAlpha:(NSNumber*)navBarBgAlpha{
    NSNumber *newNumber = navBarBgAlpha;
    if ([navBarBgAlpha floatValue]>1) {
        newNumber = @(1);
    }
    if ([navBarBgAlpha floatValue]<0) {
        newNumber = @(0);
    }
    
    objc_setAssociatedObject(self, NavBgAlphaKey, newNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)changeNavBarBgAlpha:(CGFloat)alpha{
    NSNumber *number = [NSNumber numberWithFloat:alpha];
    self.navBarBgAlpha = number;
    if ([self.navigationController.navigationBar subviews]) {
         [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:[self.navBarBgAlpha floatValue]];
    }
   
    
}
@end
