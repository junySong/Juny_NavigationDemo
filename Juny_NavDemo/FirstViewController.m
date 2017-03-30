//
//  FirstViewController.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/27.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


@interface FirstViewController ()
- (IBAction)btnClick:(UIButton *)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self changeNavBarBgAlpha:0];
    
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

- (IBAction)btnClick:(UIButton *)sender {

    SecondViewController *vc = [self.storyboard  instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
