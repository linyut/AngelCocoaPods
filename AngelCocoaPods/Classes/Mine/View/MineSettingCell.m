//
//  MineSettingCell.m
//  AngelCocoaPods
//
//  Created by 方寸山 on 2018/2/8.
//  Copyright © 2018年 LINYUT. All rights reserved.
//

#import "MineSettingCell.h"

@implementation MineSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)showCellWith:(NSDictionary *)dict
{
    self.tagImageView.image = [UIImage imageNamed:dict[@"tagImageName"]];
    self.tagNameLabel.text = dict[@"tagName"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
