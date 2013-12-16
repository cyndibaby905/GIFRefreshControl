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
    
    NSMutableArray *TwitterMusicDrawingImgs = [NSMutableArray array];
    NSMutableArray *TwitterMusicLoadingImgs = [NSMutableArray array];
    for (NSUInteger i  = 0; i <= 73; i++) {
        NSString *fileName = [NSString stringWithFormat:@"PullToRefresh_%03d.png",i];
        [TwitterMusicDrawingImgs addObject:[UIImage imageNamed:fileName]];
    }
    
    for (NSUInteger i  = 73; i <= 140; i++) {
        NSString *fileName = [NSString stringWithFormat:@"PullToRefresh_%03d.png",i];
        [TwitterMusicLoadingImgs addObject:[UIImage imageNamed:fileName]];
    }
    
    NSMutableArray *YahooWeatherDrawingImgs = [NSMutableArray array];
    NSMutableArray *YahooWeatherLoadingImgs = [NSMutableArray array];
    for (NSUInteger i  = 0; i <= 27; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [YahooWeatherDrawingImgs addObject:[UIImage imageNamed:fileName]];
    }
    
    for (NSUInteger i  = 42; i <= 109; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [YahooWeatherLoadingImgs addObject:[UIImage imageNamed:fileName]];
    }
    
    
    [scrollView addPullToRefreshWithDrawingImgs:YahooWeatherDrawingImgs andLoadingImgs:YahooWeatherLoadingImgs andActionHandler:^{
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
