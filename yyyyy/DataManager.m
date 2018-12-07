//
//  DataManager.m
//  yyyyy
//
//  Created by User on 2017/10/21.
//  Copyright © 2017年 User. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype)sharedInstance
{
    static DataManager *_dataManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dataManager = [[self alloc] init];
    });
    return _dataManager;
}

@end
