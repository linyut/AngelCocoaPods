//
//  BaseViewController.m
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/1.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import "BaseViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI
{
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 0.f;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)configTitle:(NSString *)title showLeftButton:(BOOL)isShow andrightBtnTitle:(NSString*)rightTitle
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 40)];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont systemFontOfSize:19]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.navigationItem setTitleView:titleLabel];
    
    if ([title isEqualToString:@"firstLogin"]) {
        UIImageView *bgView = [[UIImageView alloc] init];
        [bgView setFrame:self.navigationController.navigationBar.bounds];
        [bgView setImage:[UIImage imageNamed:@"First_navbar_image"]];
        [self.navigationItem setTitleView:bgView];
    }
    
    if (isShow) {
        [self configLeftItem];
    }
    if (rightTitle.length> 0) {
        [self configRightItemWithType:rightTitle];
    }
}

- (void)configLeftItem
{
    UIImage *leftImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *  leftButton  = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)leftAction:(UIButton *)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)configRightItemWithType:(NSString *) buttonType
{
    UIButton *rightButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0.0, 0.0, 80, 40)];
    rightButton.tag=521;
    if ([buttonType isEqualToString:@"branchRightImage"]) {
        rightButton.jk_width = 30;
        rightButton.jk_height = 30;
        [rightButton setImage:[UIImage imageNamed:@"branchRightImage"] forState:UIControlStateNormal];
        rightButton.adjustsImageWhenHighlighted = NO;
    }else{
        [rightButton setTitle:buttonType forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton.titleLabel setFont:[UIFont fontWithName:TEXT_FONTNAME size:13]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)rightAction:(UIButton *)sender
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
