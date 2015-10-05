//
//  KLViewController.m
//  Hypnosister
//
//  Created by Kevin on 15/9/24.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLViewController.h"
#import "KLHypnosisView.h"

@interface KLViewController () <UIScrollViewDelegate>

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    KLHypnosisView *firstView = [[KLHypnosisView alloc] initWithFrame:screenRect];
    [self.view addSubview:firstView];
    


};


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return scrollView;
}

@end
