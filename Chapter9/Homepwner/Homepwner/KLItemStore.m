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

- (NSArray *)allItems {
    return self.privateItems;
}

-(KLItem *)creatItem {
    KLItem *item = [KLItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(KLItem *)item {
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) return;
    KLItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
