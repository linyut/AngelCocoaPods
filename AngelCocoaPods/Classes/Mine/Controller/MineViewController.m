//
//  MineViewController.m
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/5.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import "MineViewController.h"
#import "MineSettingCell.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *blurImageView;
@property (weak, nonatomic) IBOutlet UIButton *headImageBtn;



@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIButton *exitBtn;




@property (nonatomic, strong) NSMutableArray *tagArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(@available(iOS 11.0, *)){
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self prepareData];
    [self createUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)prepareData
{
    self.tagArray = [NSMutableArray array];
    NSArray *tagImageArray = @[@"my_icon_密码修改_day", KAPPDELEGATE.canPolicy ? @"黑底小图标_关于我们_面容解锁" : @"my_icon_指纹管理_day", @"my_icon_更换手机号", @"my_icon_问题反馈_day", @"my_icon_关于我们_day", @"my_icon_分享APP_day"];
    NSArray *tagNameArray = @[@"密码修改", KAPPDELEGATE.canPolicy ? @"面容解锁" : @"管理指纹", @"更换手机号", @"问题反馈", @"关于我们", @"分享APP"];
    NSArray *tagVCName = @[@"UpdatePassWordViewController", @"FingerPrintManagerViewController", @"ChangeNumrPassVerifyController", @"QuestionSubmitViewController", @"VersionViewController", @"ShareMenuView"];
    for (int i=0; i<tagNameArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:tagImageArray[i] forKey:@"tagImageName"];
        [dict setObject:tagNameArray[i] forKey:@"tagName"];
        [dict setObject:tagVCName[i] forKey:@"tagVCName"];
        [self.tagArray addObject:dict];
    }

}

- (void)createUI
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
    
    [self.exitBtn jk_shadowWithColor:UIColorFromRGB(0xF6354D) offset:CGSizeMake(0, 3) opacity:5.0 radius:3.0];
    [self.exitBtn jk_cornerRadius:22 strokeSize:0.0 color:UIColorFromRGB(0xFFFFFF)];
    [self.headImageBtn jk_cornerRadius:40 strokeSize:2.0 color:UIColorFromRGB(0xFFFFFF)];
    self.headImageBtn.layer.masksToBounds = YES;
}
- (IBAction)modifyBtnClick:(UIButton *)sender {
}
- (IBAction)headImageBtnClick:(UIButton *)sender {
}
- (IBAction)exitBtnClick:(UIButton *)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tagArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineSettingCell *cell = [[NSBundle mainBundle] loadNibNamed:@"MineSettingCell" owner:nil options:nil].lastObject;
    [cell showCellWith:self.tagArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
