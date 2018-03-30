//
//  TOPCell.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/15.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "TOPCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@implementation TOPCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.handsImageV];
        [self.contentView addSubview:self.reciveLable];
        [self.contentView addSubview:self.arrowImagv];
    }
    return self;
}
#pragma mark topHeadView
- (UIImageView *)handsImageV
{
    if (!_handsImageV) {
        _handsImageV = [[UIImageView alloc]initWithFrame:CGRectMake(15*height_per, 16*height_per, 40*height_per, 40*height_per)];
        _handsImageV.image = [UIImage imageNamed:@"message_icon_praise"];
    }
    return _handsImageV;
}
- (UILabel *)reciveLable
{
    if (!_reciveLable) {
        _reciveLable = [[UILabel alloc]initWithFrame:CGRectMake(65*height_per, (72-27)/2*height_per, 120, 27*height_per)];
        _reciveLable.textAlignment = NSTextAlignmentLeft;
        _reciveLable.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
        _reciveLable.font = [UIFont systemFontOfSize:14.0];
        
    }
    return _reciveLable;
}
- (UIImageView *)arrowImagv
{
    if (!_arrowImagv) {
        _arrowImagv = [[UIImageView alloc]initWithFrame:CGRectMake(348*height_per, 31*height_per, 7*height_per, 10*height_per)];
        _arrowImagv.image = [UIImage imageNamed:@"bar_icon_forward"];
    }
    return _arrowImagv;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
