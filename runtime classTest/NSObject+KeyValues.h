//
//  NSObject+KeyValues.h
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyValues)

+(id)objectWithKeyValues:(NSDictionary *)aDictionary;

-(NSDictionary *)keyValuesWithObject;


@end
