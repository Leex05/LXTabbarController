//
//  LXTabbarController.m
//  LXTabbarController
//
//  Created by leex on 2017/9/21.
//  Copyright © 2017年 leex. All rights reserved.
//

#import "LXTabbarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "LXNavgationController.h"
#import "ViewController.h"

#import "UIWindow+ViewControlle.h"
@interface LXTabbarController ()<UITabBarControllerDelegate>

@end

@implementation LXTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self loadControllers];
}

- (void)loadControllers {
    
    OneViewController *oneVC = [OneViewController new];
    LXNavgationController *oneNav = [self createOneChildVc:oneVC title:@"页面" imageName:@"qiuqiu_nor" selectedImageName:@"qiuqiu_sel"];
    
    TwoViewController *twoVC = [TwoViewController new];
    LXNavgationController *twoNav = [self createOneChildVc:twoVC title:@"页面" imageName:@"qiuqiu_nor" selectedImageName:@"qiuqiu_sel"];
    
    ThreeViewController *threeVC = [ThreeViewController new];
    LXNavgationController *threeNav = [self createOneChildVc:threeVC title:@"页面" imageName:@"qiuqiu_nor" selectedImageName:@"qiuqiu_sel"];
    
    FourViewController *fourVC = [FourViewController new];
    LXNavgationController *fourNav = [self createOneChildVc:fourVC title:@"页面" imageName:@"qiuqiu_nor" selectedImageName:@"qiuqiu_sel"];
    
    [oneVC.navigationController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-10, -1)];
    [twoVC.navigationController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-30, -1)];
    [threeVC.navigationController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(30, -1)];
    [fourVC.navigationController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(10, -1)];
    
    self.viewControllers = @[oneNav,twoNav,threeNav,fourNav];
    //自定义按钮
    UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-62)/2, 49-62, 62, 62)];
    bgImgView.userInteractionEnabled = YES;
    bgImgView.layer.cornerRadius = 31;
    bgImgView.layer.masksToBounds = YES;
    bgImgView.image = [UIImage imageNamed:@"middle"];
    [self.tabBar addSubview:bgImgView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((62-40)/2, (62-40)/2.0, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"center"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tabBarDidClickPlusButton) forControlEvents:UIControlEventTouchUpInside];
    
    [bgImgView addSubview:btn];
    
    
}

//中间按钮点击事件
- (void)tabBarDidClickPlusButton
{
    ViewController *vc = [ViewController new];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    vc.hidesBottomBarWhenPushed = YES;
    [(UINavigationController*)[window visibleViewController] pushViewController:vc animated:YES];
    
}


-(LXNavgationController *)createOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;  //相当于设置了后两者的标题
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:90/255.0 green:204/255.0 blue:250/255.0 alpha:1/1.0];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //设置图标
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    LXNavgationController *lxNav = [[LXNavgationController alloc] initWithRootViewController:childVc];
    
    return lxNav;
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

@end
