//
//  CopyModel.h
//  yyyyy
//
//  Created by User on 2017/12/14.
//  Copyright © 2017年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CopyModel : NSObject <NSMutableCopying>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSMutableArray *list;

@end
