//
//  SecondViewController.m
//  Juny_NavDemo
//
//  Created by 宋俊红 on 17/3/16.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+NavExtension.h"
#import "NLTransitionAnimation.h"
#import "ImageViewController.h"

@interface SecondViewController () <
UIGestureRecognizerDelegate,
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate>{
     UINavigationController     *_newNav;
}

@property (nonatomic, assign) BOOL statusBarShouldLight;//
@property (nonatomic, strong) UITableView *tableView;//


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[UINavigationBar appearance]setBarStyle:UIBarStyleBlackTranslucent];
    _statusBarShouldLight = YES;//默认是白色的
    
    [self changeNavBarBgAlpha:0];
    self.navigationController.delegate = self;
    
   
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    imageView.image = [UIImage imageNamed:@"zhengti-bg"];
    _tableView.tableHeaderView = imageView;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: rid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (!_newNav) {
//        ImageViewController *vc = [[ImageViewController alloc]init];
//        _newNav = [[UINavigationController alloc]initWithRootViewController:vc];
//        _newNav.view.frame=CGRectMake(_newNav.view.frame.origin.x, [UIScreen mainScreen].bounds.size.height - 300 , [UIScreen mainScreen].bounds.size.width, 300);
////        vc.view.frame = CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width, 300);
//        vc.view.frame = _newNav.view.frame;
//        [vc.view layoutSubviews];
//        [self addChildViewController:_newNav];
//        [self.view addSubview:_newNav.view];
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//支持设备自动旋转

- (BOOL)shouldAutorotate{
    
    return YES;
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscape;
    
}

#pragma mark------------------delegate----------------------
#pragma mark------------------scrollViewDelegate----------------------

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat min = 300 -64-64;
    CGFloat max = 300-64;
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    [self changeNavBarBgAlpha:(contentOffsetY - min)/64.0];
}

//#pragma mark --------UINavigationControllerDelegate-----------
//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
//    
//    if(operation == UINavigationControllerOperationPop){
//        
//        return [NLTransitionAnimation new];
//    }
//    else{
//        return nil;
//    }
//}
@end
