//
//  PersonModel.h
//  yyyyy
//
//  Created by User on 2017/11/21.
//  Copyright © 2017年 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PetModel.h"

@interface PersonModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *ID_card_num;

@property (nonatomic, strong) NSArray<PetModel *> *petArr;

@end
