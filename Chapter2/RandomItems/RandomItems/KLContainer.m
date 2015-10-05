//
//  KLContainer.m
//  RandomItems
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "KLContainer.h"

@implementation KLContainer

- (NSArray *)subitems
{
    if (!_subitems) {
        _subitems = ({
            NSMutableArray *items = [NSMutableArray array];
            for (int i = 0; i < 5; i++) {
                [items addObject:[KLItem randomItem]];
            }
            items;
        });
    }
    return _subitems;
}

-(NSString *)description
{
    NSInteger totalWorth = self.valueInDollars;
    NSMutableString *subStrings = [[NSMutableString alloc] init];
    for (KLItem *item in self.subitems) {
        totalWorth += item.valueInDollars;
        [subStrings appendString:[NSString stringWithFormat:@"%@\n",item]];
    }
    
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@: Total worth $%ld, subitmes: %@",
     self.itemName,
     totalWorth,
     subStrings];
    return descriptionString;
}
@end
