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

#define LASTSECTION self.tableView.numberOfSections - 1

@interface KLItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation KLItemsViewController
#pragma mark - designated initializer
- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i = 0; i < 5; i++) {
//            [[KLItemStore sharedStore] creatItem];
//        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (UIView *)headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UItableViewCell"];
    
    UIView *view = self.headerView;
//    self.tableView.tableHeaderView = self.headerView;
    [self.tableView setTableHeaderView:view];
}


#pragma mark - tableView Data Source Methods
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [KLItemStore sharedStore].allItems.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UItableViewCell" forIndexPath:indexPath];
    NSArray *items = [KLItemStore sharedStore].allItems;
    if (indexPath.section == 0) {
        KLItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    } else {
        cell.textLabel.text = @"No more items!";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[KLItemStore sharedStore] removeItem:[KLItemStore sharedStore].allItems[indexPath.row]];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == LASTSECTION ?  NO : YES;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == LASTSECTION ?  NO : YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (destinationIndexPath.section == LASTSECTION) return;
    [[KLItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                       toIndex:destinationIndexPath.row];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    return proposedDestinationIndexPath.section == LASTSECTION ? sourceIndexPath : proposedDestinationIndexPath;
}

- (IBAction)addNewItem:(id)sender {
    KLItem *item = [[KLItemStore sharedStore] creatItem];
    NSInteger lastRow = [[KLItemStore sharedStore].allItems indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)toggleEditingMode:(id)sender {
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}



@end
