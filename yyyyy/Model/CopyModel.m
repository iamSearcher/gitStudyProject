//
//  CopyModel.m
//  yyyyy
//
//  Created by User on 2017/12/14.
//  Copyright © 2017年 User. All rights reserved.
//

#import "CopyModel.h"

@implementation CopyModel

- (id)mutableCopyWithZone:(NSZone *)zone
{
    CopyModel *model = [[[self class] allocWithZone:zone] init];
    
    model.name = self.name;
    
    model.list = self.list;
    
    return model;
}

@end
