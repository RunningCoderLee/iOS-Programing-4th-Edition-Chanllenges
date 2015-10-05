//
//  KLContainer.h
//  RandomItems
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "KLItem.h"

@interface KLContainer : KLItem
@property (nonatomic, strong) NSArray *subitems;

- (NSString *)description;

@end
