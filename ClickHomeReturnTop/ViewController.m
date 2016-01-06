//
//  ViewController.m
//  tableViewTest
//
//  Created by 唐建平 on 16/1/5.
//  Copyright © 2016年 tangjp. All rights reserved.
//

#import "ViewController.h"
#import "TCTabBarController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate>
@property (nonatomic ,weak) UITableView *table;
@end

@implementation ViewController

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(TCTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    // 点击首页返回屏幕顶部
    if (tabBarController.lastSelectedIndex == self.tabBarController.selectedIndex ) {
        [self.table setContentOffset:CGPointZero animated:YES];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tabBarController.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    //  创建一个tableView
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    self.table = table;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test---%ld",indexPath.row];
    return cell;
}

























@end
