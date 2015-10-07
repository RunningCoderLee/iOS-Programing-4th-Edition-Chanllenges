//
//  ViewController.m
//  Homepwner
//
//  Created by Kevin on 15/9/25.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLItemsViewController.h"
#import "KLItem.h"
#import "KLItemStore.h"

@interface KLItemsViewController () <UITableViewDataSource>
@property (nonatomic, strong)  NSArray *itemStore;

@end

@implementation KLItemsViewController
#pragma mark - designated initializer
- (instancetype)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[KLItemStore sharedStore] creatItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSArray *)itemStore {
    if (!_itemStore) {
        _itemStore = [KLItemStore sharedStore].allGroups;
    }
    return _itemStore;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UItableViewCell"];
//    self.tableView.rowHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.itemStore.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == self.itemStore.count) {
        return 1;
    }
    return [self.itemStore[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UItableViewCell" forIndexPath:indexPath];
    if (indexPath.section == self.itemStore.count) {
        cell.textLabel.text = @"No more items!";
    } else {
        NSArray *group =  self.itemStore[indexPath.section];
        KLItem *item = group[indexPath.row];

    //    KLItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == self.itemStore.count) {
        return 80;
    }
    return 44;
}

@end
