//
//  PersonModel.m
//  yyyyy
//
//  Created by User on 2017/11/21.
//  Copyright © 2017年 User. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ID_card_num forKey:@"ID_card_num"];
    [aCoder encodeObject:self.petArr forKey:@"petArr"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.ID_card_num = [aDecoder decodeObjectForKey:@"ID_card_num"];
        self.petArr = [aDecoder decodeObjectForKey:@"petArr"];
    }
    
    return self;
}

@end
