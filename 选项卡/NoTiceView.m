//
//  NoTiceView.m
//  KanKan
//
//  Created by dzc on 17/2/24.
//  Copyright © 2017年 fantexix Inc. All rights reserved.
//160高度

#import "NoTiceView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define height_per ([UIScreen mainScreen].bounds.size.width)/375

@interface NoTiceView ()

@property (nonatomic,strong)UIImageView *defaultView;
@property (nonatomic,strong)UILabel *noticeLa;
@property (nonatomic,strong)NSString *imagestr;
@property (nonatomic,strong)NSString *titlestr;

@end

@implementation NoTiceView

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        _imagestr = image;
        _titlestr = title;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.defaultView];
        [self addSubview:self.noticeLa];
        if ([image isEqualToString:@"default_message"]) {
            _defaultView.frame = CGRectMake((ScreenWidth-207*height_per)/2, 10, 207*height_per, 81*height_per);
            _noticeLa.frame = CGRectMake(0, _defaultView.frame.origin.y+130/2+40, ScreenWidth, 20);
        }

        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(relaodtata)];
        [self addGestureRecognizer:tap];
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)relaodtata
{
    if (_delegate && [_delegate respondsToSelector:@selector(reloadDATAFromxx)]) {
        [_delegate reloadDATAFromxx];
    }
}
- (UIImageView *)defaultView
{
    if (!_defaultView) {
        _defaultView = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-294/2)/2, 10, 294/2, 130/2)];
        _defaultView.image = [UIImage imageNamed:_imagestr];
        _defaultView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _defaultView;
}
- (UILabel *)noticeLa
{
    if (!_noticeLa) {
        _noticeLa = [[UILabel alloc]initWithFrame:CGRectMake(0, self.defaultView.frame.origin.y+130/2+30, ScreenWidth, 20)];
        _noticeLa.text = _titlestr;
        _noticeLa.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        _noticeLa.textAlignment = NSTextAlignmentCenter;
        _noticeLa.font = [UIFont systemFontOfSize:16.0];
    }
    return _noticeLa;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
