//
//  Son.m
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import "Son.h"

@implementation Son

-(instancetype)init{
    if (self = [super init]) {
        
        NSLog(@"self = %@",NSStringFromClass([self class]));
        NSLog(@"super = %@",NSStringFromClass([super class]));

        
    }
    return self;
}

@end
