//
//  MessageCell.m
//  选项卡
//
//  Created by CYAX_BOY on 17/5/15.
//  Copyright © 2017年 CYAX_BOY. All rights reserved.
//

#import "MessageCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define height_per ([UIScreen mainScreen].bounds.size.width)/375


@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageVV];
        [self.contentView addSubview:self.messageLable];
        [self.contentView addSubview:self.showImageV];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}
#pragma mark topHeadView
- (UIImageView *)headImageVV
{
    if (!_headImageVV) {
        _headImageVV = [[UIImageView alloc]initWithFrame:CGRectMake(15*height_per, 16*height_per, 40*height_per, 40*height_per)];
    }
    return _headImageVV;
}
- (UILabel *)messageLable
{
    if (!_messageLable) {
        _messageLable = [[UILabel alloc]initWithFrame:CGRectMake(65*height_per, 17*height_per, 120, 27*height_per)];
        _messageLable.textAlignment = NSTextAlignmentLeft;
        _messageLable.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
        _messageLable.font = [UIFont systemFontOfSize:14.0];
        
    }
    return _messageLable;
}
- (UIImageView *)showImageV
{
    if (!_showImageV) {
        _showImageV = [[UIImageView alloc]initWithFrame:CGRectMake(279*height_per, (72-47)/2*height_per, 82*height_per, 47*height_per)];
    }
    return _showImageV;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(66*height_per, 52*height_per, 150, 20*height_per)];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        _timeLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _timeLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
