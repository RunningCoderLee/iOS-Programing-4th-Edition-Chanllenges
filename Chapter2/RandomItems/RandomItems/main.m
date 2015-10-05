//
//  main.m
//  RandomItems
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLItem.h"
#import "KLContainer.h"

void goldChallenge()
{
    KLContainer *container = [KLContainer randomItem];
    NSLog(@"%@", container);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSMutableArray *items = [[NSMutableArray alloc] init];
//        
//        for (int i = 0; i < 10; i++) {
//            KLItem *item = [KLItem randomItem];
//            [items addObject:item];
//        }
//        
//        for (KLItem *item in items) {
//            NSLog(@"%@", item);
//        }
//        
//        items = nil;
        
        goldChallenge();

    }
    return 0;
}


