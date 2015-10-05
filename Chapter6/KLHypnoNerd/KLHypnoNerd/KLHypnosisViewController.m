//
//  KLHypnosisViewController.m
//  KLHypnoNerd
//
//  Created by Kevin on 15/9/25.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLHypnosisViewController.h"
#import "KLHypnosisView.h"

@interface KLHypnosisViewController ()

@property (nonatomic, weak) UISegmentedControl *segment;

@end

@implementation KLHypnosisViewController

- (void)loadView {
    KLHypnosisView *backgroundView = [[KLHypnosisView alloc] init];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(60, 460, 200, 50)];
    [segment insertSegmentWithTitle:@"Red" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"Green" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"Blue" atIndex:2 animated:YES];
    [segment addTarget:self action:@selector(segmentDidClick) forControlEvents:UIControlEventValueChanged];
    self.segment = segment;
    [backgroundView addSubview:segment];
    
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    return self;
}

- (void)segmentDidClick {
    KLHypnosisView *tmp = (KLHypnosisView *)self.view;
    if ([self.segment selectedSegmentIndex] == 0) {
        tmp.circleColor = [UIColor redColor];
    } else if ([self.segment selectedSegmentIndex] == 1) {
        tmp.circleColor = [UIColor greenColor];
    } else if ([self.segment selectedSegmentIndex] == 2) {
        tmp.circleColor = [UIColor blueColor];
    }
}
@end
