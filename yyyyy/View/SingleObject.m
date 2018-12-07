//
//  SingleObject.m
//  yyyyy
//
//  Created by User on 2017/12/14.
//  Copyright © 2017年 User. All rights reserved.
//

#import "SingleObject.h"

@implementation SingleObject 

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static SingleObject *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}


+ (instancetype)shareInstance
{
    return [[self alloc] init];
}

- (void)testMethod
{
    NSString *urlString = @"https://www.baidu.com&username=高";
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
