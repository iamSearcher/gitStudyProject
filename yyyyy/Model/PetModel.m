//
//  PetModel.m
//  yyyyy
//
//  Created by User on 2017/11/21.
//  Copyright © 2017年 User. All rights reserved.
//

#import "PetModel.h"

@implementation PetModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.pet_name forKey:@"pet_name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.pet_name = [aDecoder decodeObjectForKey:@"pet_name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    
    return self;
}


@end
