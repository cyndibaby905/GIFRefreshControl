//
//  UIScrollView+GifPullToRefresh.h
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 HangChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHGifRefreshControl : UIView
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, copy) void (^pullToRefreshActionHandler)(void);
- (void)endLoading;
@end

@interface UIScrollView (GifPullToRefresh)
@property(nonatomic,strong)CHGifRefreshControl *refreshControl;

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler;
- (void)didFinishPullToRefresh;
@end


