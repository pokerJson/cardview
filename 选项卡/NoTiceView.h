//
//  NoTiceView.h
//  KanKan
//
//  Created by dzc on 17/2/24.
//  Copyright © 2017年 fantexix Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoTiceViewDelegate <NSObject>

- (void)reloadDATAFromxx;

@end

@interface NoTiceView : UIView

@property (nonatomic,assign)id<NoTiceViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;

@end
