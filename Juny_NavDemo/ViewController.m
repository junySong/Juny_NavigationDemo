//
//  ViewController.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/16.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "UIViewController+NavExtension.h"
#import "UINavigationController+Juny.h"
@interface ViewController ()
- (IBAction)butonClick:(UIButton *)sender forEvent:(UIEvent *)event;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20.5, 70.5, 50, 30)];
    label.text = @"123";
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label];
    [self changeNavBarBgAlpha:1];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)butonClick:(UIButton *)sender forEvent:(UIEvent *)event {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"storyboard" bundle:[NSBundle mainBundle]];//这里的bundle 写nil也可以代表是mainBundle
//    SecondViewController *vc = [self.storyboard  instantiateViewControllerWithIdentifier:@"SecondViewController"];
    FirstViewController *vc = [self.storyboard  instantiateViewControllerWithIdentifier:@"FirstViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
@end
