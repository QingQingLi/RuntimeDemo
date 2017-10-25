//
//  Test.h
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSNumber *phoneNumber;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) Test *son;

@end
