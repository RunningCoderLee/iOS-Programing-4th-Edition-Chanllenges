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

@property (nonatomic, strong) KLHypnosisView *hypnosisView;

@end

@implementation KLViewController

- (KLHypnosisView *)hypnosisView
{
    if (!_hypnosisView) {
        _hypnosisView = [[KLHypnosisView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height * 2)];
    }
    return _hypnosisView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
//    KLHypnosisView *firstView = [[KLHypnosisView alloc] initWithFrame:bigRect];
    [scrollView addSubview:self.hypnosisView];
    
//    screenRect.origin.x += screenRect.size.width;
//    KLHypnosisView *secondView = [[KLHypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:secondView];
    
    //    [self.window addSubview:scrollView];
    
    
    scrollView.contentSize = bigRect.size;
    scrollView.pagingEnabled = NO;
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 0.2; 
    scrollView.delegate = self;

};


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.hypnosisView;
}

@end
