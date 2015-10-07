//
//  KLItemStore.m
//  Homepwner
//
//  Created by Kevin on 15/9/26.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLItemStore.h"
#import "KLItem.h"

@interface KLItemStore ()
@property (nonatomic, strong) NSMutableArray *privateItems;
@property (nonatomic, strong) NSMutableArray *privateGroups;
@property (nonatomic, strong) NSMutableArray *lessThan50Groups;
@property (nonatomic, strong) NSMutableArray *graterThan50Groups;


@end

@implementation KLItemStore
#pragma mark - initialization
+ (instancetype)sharedStore {
    static KLItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[KLItemStore shardStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    if (self = [super init]) {
        _privateItems = [NSMutableArray array];
    }
    return self;
}

- (NSMutableArray *)graterThan50Groups {
    if (!_graterThan50Groups) {
        _graterThan50Groups = [NSMutableArray array];
    }
    return _graterThan50Groups;
}

- (NSMutableArray *)lessThan50Groups {
    if (!_lessThan50Groups) {
        _lessThan50Groups = [NSMutableArray array];
    }
    return _lessThan50Groups;
}

- (NSArray *)allItems {
    return self.privateItems;
}

- (NSArray *)allGroups {
     return @[self.graterThan50Groups,self.lessThan50Groups];
}

-(KLItem *)creatItem {
    KLItem *item = [KLItem randomItem];
    if (item.valueInDollars > 50) {
        [self.graterThan50Groups addObject:item];
    } else {
        [self.lessThan50Groups addObject:item];
    }
//    [self.privateItems addObject:item];
    return item;
}

@end
