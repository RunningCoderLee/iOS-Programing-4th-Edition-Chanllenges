//
//  KLItemStore.h
//  Homepwner
//
//  Created by Kevin on 15/9/26.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KLItem;

@interface KLItemStore : NSObject
//@property (nonatomic, readonly, strong) NSArray *allItems;
@property (nonatomic, readonly, strong) NSArray *allGroups;

+ (instancetype)sharedStore;

- (KLItem *)creatItem;

@end
