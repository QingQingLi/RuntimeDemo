//
//  UIButton+ClickBlock.h
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBlock)(void);

@interface UIButton (ClickBlock)

@property (nonatomic, copy)clickBlock click;

@end
