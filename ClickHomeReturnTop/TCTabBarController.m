//
//  TCTabBarController.m
//  点击首页返回屏幕顶部
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCTabBarController.h"
#import "ViewController.h"

@interface TCTabBarController ()

@end

@implementation TCTabBarController

/**
 *  重写父类的setSelectedIndex方法,在父类调用之前获取最后一次选中的位置
 *
 *  @param selectedIndex 当前选中的位置
 */
-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    // 用户手动设置的时候
    self.lastSelectedIndex = self.selectedIndex;
    
    //调用父类的setSelectedIndex
    [super setSelectedIndex:selectedIndex];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    // 用户点击了tabbar某一项的时候
    _lastSelectedIndex = self.selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIImage imageNamed:@"tab_icon_shouye_default"];
    ViewController *homeVC = [[ViewController alloc]init];
    [self addChildVc:homeVC Title:@"首页" Image:@"tab_icon_shouye_default" SelectedImage:@"tab_icon_shouye_selected"];

    [self.tabBar setTintColor:[UIColor redColor]];
}


/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中后的图片
 */
- (void)addChildVc:(UIViewController *)childVc Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedImage {
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
@end
