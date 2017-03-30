//
//  ImageViewController.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/24.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()


@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView.image = [UIImage imageNamed:@"zhengti-bg"];
    [self.view addSubview:_imageView];
    
    _myview= [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20)];
    _myview.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_myview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews{
    _imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _myview.frame = CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20);
}

//- (void)setHeight:(CGFloat)height{
//    if (height>0) {
//        CGRect  rect = self.view.frame;
//        self.view.frame = CGRectMake(0, 0, rect.size.width, height);
//        [self.view layoutSubviews];
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
