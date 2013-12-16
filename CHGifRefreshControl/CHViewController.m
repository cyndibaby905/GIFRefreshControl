//
//  CHViewController.m
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 HangChen. All rights reserved.
//

#import "CHViewController.h"
#import "UIScrollView+GifPullToRefresh.h"

@interface CHViewController ()

@end

@implementation CHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    __weak UIScrollView *tempScrollView = scrollView;
    [scrollView addPullToRefreshWithDrawingImgs:nil andLoadingImgs:nil andActionHandler:^{
        [tempScrollView performSelector:@selector(didFinishPullToRefresh) withObject:nil afterDelay:3];

    }];
    scrollView.alwaysBounceVertical = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrollView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
