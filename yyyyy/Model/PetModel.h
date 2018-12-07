//
//  PetModel.h
//  yyyyy
//
//  Created by User on 2017/11/21.
//  Copyright © 2017年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PetModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *pet_name;

@property (nonatomic, assign) NSInteger age;

@end
