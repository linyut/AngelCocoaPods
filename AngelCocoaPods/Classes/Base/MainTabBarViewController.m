//
//  MainTabBarViewController.m
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/5.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "OtherViewController.h"
#import "NewsViewController.h"
#import "MineViewController.h"


@interface MainTabBarViewController ()<UITabBarDelegate>

@property (nonatomic, strong) NSArray *controlArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *selectImageArray;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)prepareData
{
    self.controlArray = @[@"HomeViewController", @"OtherViewController", @"NewsViewController", @"MineViewController"];
    self.titleArray = @[@"首页", @"其它", @"消息", @"我的"];
    self.imageArray = @[@"icon_news",@"icon_price",@"icon_bbs",@"icon_personal"];
    self.selectImageArray = @[@"icon_news_down",@"icon_price_down",@"icon_bbs_down",@"icon_personal_down"];
}

- (void)createUI
{
    self.navigationController.navigationBarHidden = NO;
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i=0; i<self.controlArray.count; i++) {
        Class class = NSClassFromString(self.controlArray[i]);
        BaseViewController *VC = [[class alloc] init];
        VC.view.backgroundColor = [UIColor whiteColor];
        VC.tabBarItem.title = self.titleArray[i];
        VC.tabBarItem.image = [[UIImage imageNamed:_imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        VC.tabBarItem.selectedImage = [[UIImage imageNamed:_selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:VC];
        [array addObject:navVC];
    }
    
    self.tabBar.clipsToBounds = YES;
    self.tabBar.backgroundColor = UIColorFromRGB(0x666666);
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.selectedIndex = 2;
    self.viewControllers = array;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
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
