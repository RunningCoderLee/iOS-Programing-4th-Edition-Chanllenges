//
//  KLItem.h
//  RandomItems
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    NSInteger _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype)randomItem;

// Designated initializer for KLItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (NSInteger)valueInDollars;

- (NSDate *)dateCreated;

@end
