//
//  UIScrollView+GifPullToRefresh.m
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 HangChen. All rights reserved.
//

#import "UIScrollView+GifPullToRefresh.h"
#import <objc/runtime.h>

#define GifRefreshControlHeight 100.0

typedef enum
{
	GifPullToRefreshStateNormal = 0,
    GifPullToRefreshStateDrawing,
	GifPullToRefreshStateLoading,
} GifPullToRefreshState;



static char UIScrollViewGifPullToRefresh;
@implementation UIScrollView (GifPullToRefresh)

- (void)setRefreshControl:(CHGifRefreshControl *)pullToRefreshView {
    [self willChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
    objc_setAssociatedObject(self, &UIScrollViewGifPullToRefresh,
                             pullToRefreshView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
}

- (CHGifRefreshControl *)refreshControl {
    return objc_getAssociatedObject(self, &UIScrollViewGifPullToRefresh);
}

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler
{
    CHGifRefreshControl *view = [[CHGifRefreshControl alloc] initWithFrame:CGRectMake(0, -GifRefreshControlHeight, self.bounds.size.width, GifRefreshControlHeight)];
    view.scrollView = self;
    [self addSubview:view];
    self.refreshControl = view;

    [self addObserver:view forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    
}


- (void)didFinishRefresh
{

}


@end


@implementation CHGifRefreshControl {
    GifPullToRefreshState _state;
    BOOL _isTrigged;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (self.scrollView.contentOffset.y <= 0) {
        [self scrollViewContentOffsetChanged];
    }

}

- (void)scrollViewContentOffsetChanged
{
    if (!_isTrigged) {
        if (!self.scrollView.isDragging && self.scrollView.isDecelerating && self.scrollView.contentOffset.y < -GifRefreshControlHeight) {
            _isTrigged = YES;
            [self setState:GifPullToRefreshStateLoading];
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 self.scrollView.contentInset = UIEdgeInsetsMake(GifRefreshControlHeight, 0.0f, 0.0f, 0.0f);
                             }
                             completion:nil];
            
            double delayInSeconds = 5.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                _isTrigged = NO;
                [UIView animateWithDuration:0.2
                                      delay:0
                                    options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.scrollView.contentInset = UIEdgeInsetsMake(0, 0.0f, 0.0f, 0.0f);
                                 }
                                 completion:nil];
            });
        }
        else {
            [self setState:GifPullToRefreshStateDrawing];
        }
        
    }
}


- (void)setState:(GifPullToRefreshState)aState{
	
	CGFloat offset = -self.scrollView.contentOffset.y;
    CGFloat percent = 0;
    if (offset < 0) {
        offset = 0;
    }
    if (offset > GifRefreshControlHeight) {
        offset = GifRefreshControlHeight;
    }
    percent = offset / GifRefreshControlHeight;
	switch (aState)
	{

        case GifPullToRefreshStateDrawing:
            NSLog(@"GifPullToRefreshStateDrawing:%f",percent);
            break;
            
		case GifPullToRefreshStateLoading:
            NSLog(@"GifPullToRefreshStateLoading");
            break;
        case GifPullToRefreshStateNormal:
		default:
            break;
	}
	
	_state = aState;
	
    
    [self setNeedsLayout];
}


@end