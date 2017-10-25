//
//  ViewController.m
//  runtime classTest
//
//  Created by 0.0 on 2017/10/17.
//  Copyright © 2017年 YXzr. All rights reserved.
//

#import "ViewController.h"
#import "Son.h"
#import "UIButton+ClickBlock.h"
#import "Test.h"
#import "NSObject+KeyValues.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dictionary = @{
                   @"name":@"Dave Ping",
                   @"age":@24,
                   @"phoneNumber":@18718871111,
                   @"height":@180.5,
                   @"info":@{
                           @"address":@"Guangzhou",
                           },
                   @"son":@{
                           @"name":@"Jack",
                           @"info":@{
                                   @"address":@"London",
                                   },
                           }
                   };
    
//    [self categoryTest];
    [self keyValuesTest];
}

- (void)classTest{
    Son *son = [[Son alloc] init];
}

- (void)categoryTest{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = self.view.bounds;
    [self.view addSubview:button];
    button.click = ^{
        
        NSLog(@"buttonClick");
    };
}

- (void)keyValuesTest{
    Test *model = [Test objectWithKeyValues:dictionary];
    NSLog(@"name is %@",model.name);
    NSLog(@"son name is %@",model.son.name);
    
    NSDictionary *dict = [model keyValuesWithObject];
    NSLog(@"dict is %@",dict);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
