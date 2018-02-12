//
//  MineSettingCell.h
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/8.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineSettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;
@property (weak, nonatomic) IBOutlet UILabel *tagNameLabel;


- (void)showCellWith:(NSDictionary *)dict;

@end
