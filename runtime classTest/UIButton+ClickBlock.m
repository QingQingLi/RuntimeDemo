//
//  UIButton+ClickBlock.m
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>
static const void *associatedKey = "associatedKey";


@implementation UIButton (ClickBlock)
//Category中的属性，只会生成setter和getter方法，不会生成成员变量

- (void)setClick:(clickBlock)click{
    objc_setAssociatedObject(self, associatedKey, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];//移除上次的关联
    if (click) {
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (clickBlock)click{
    return objc_getAssociatedObject(self, associatedKey);
}

- (void)buttonClick{
    if (self.click) {
        self.click();
    }
}

@end
