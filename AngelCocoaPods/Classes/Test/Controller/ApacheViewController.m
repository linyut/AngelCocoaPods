//
//  ApacheViewController.m
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/5.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import "ApacheViewController.h"
#import <UIImage+AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#define kURL @"https://upload-images.jianshu.io/upload_images/325120-fee77d23dcf68c61.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/700"
#define kLocalURL  @"http://192.168.1.150/APP/Resources/Images/0001.jpg"

@interface ApacheViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;



@end

@implementation ApacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)createUI
{
    [self.testImageView setImageWithURL:[NSURL URLWithString:kLocalURL]];
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
