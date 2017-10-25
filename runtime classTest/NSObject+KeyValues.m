//
//  NSObject+KeyValues.m
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import "NSObject+KeyValues.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (KeyValues)


+(id)objectWithKeyValues:(NSDictionary *)aDictionary{
    id objC = [[self alloc] init];
    for (NSString *key in aDictionary.allKeys) {
        id value = aDictionary[key];
        //判断当前属性是不是model
        objc_property_t property = class_getProperty(self, key.UTF8String);
        unsigned int outCount = 0;
        objc_property_attribute_t *attributeList = property_copyAttributeList(property, &outCount);
        objc_property_attribute_t  attribute = attributeList[0];
        NSString *typeString = [NSString stringWithUTF8String:attribute.value];
        if ([typeString isEqualToString:@"@\"Test\""]) {
            value = [self objectWithKeyValues:value];
        }
        
        //生成setter方法，用objc_msgSend调用
        NSString *methodName = [NSString stringWithFormat:@"set%@%@:",[key substringToIndex:1].uppercaseString,[key substringFromIndex:1]];
        SEL setter = sel_registerName(methodName.UTF8String);
        if ([objC respondsToSelector:setter]) {
            ((void (*) (id,SEL,id)) objc_msgSend) (objC,setter,value);
        }
        free(attributeList);
    }
    return objC;
}

-(NSDictionary *)keyValuesWithObject{
    unsigned int outCount = 0;
    objc_property_t *properyList = class_copyPropertyList([self class], &outCount);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < outCount; i ++) {
        
        objc_property_t propery = properyList[i];
        
        //生成setter 方法  msg_send调用
        const char *properyName = property_getName(propery);
        SEL getter = sel_registerName(properyName);
        if ([self respondsToSelector:getter]) {
            id value = ((id (*) (id,SEL)) objc_msgSend) (self,getter);
            
            //判断当前属性是不是Model
            if ([value isKindOfClass:[self class]] && value) {
                value = [value keyValuesWithObject];
            }
            
            if (value) {
                NSString *key = [NSString stringWithUTF8String:properyName];
                [dict setObject:value forKey:key];
            }
        }
        
    }
    
    free(properyList);
    return dict;
}


@end
