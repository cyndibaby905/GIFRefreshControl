
## CHGifRefreshControl ##

"Twitter music" and "Yahoo! Weather" like pull-to-refresh control created using GIF.

Completely created using UIKit framework.

Easy to drop into your project.

You can add your favorite gif animation to your own project, `CHGifRefreshControl` make it super easy.


## Requirements ##

CHGifRefreshControl requires Xcode 5, targeting either iOS 5.0 and above, ARC-enabled.


## How to use ##
	
Drag UIScrollView+GifPullToRefresh.h amd UIScrollView+GifPullToRefresh.m files to your project. 

No other frameworks required.

    #import "UIScrollView+GifPullToRefresh.h"

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        
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
    __weak UIScrollView *tempScrollView = scrollView;
    [scrollView addPullToRefreshWithDrawingImgs:TwitterMusicDrawingImgs andLoadingImgs:TwitterMusicLoadingImgs andActionHandler:^{
    	//Do your own work when refreshing, and don't forget to end the animation after work finished.
        [tempScrollView performSelector:@selector(didFinishPullToRefresh) withObject:nil afterDelay:3];

    }];
And do not forget to remove it in your viewController's `dealloc` method:

    [scrollView removePullToRefresh];

    
## Tips ##
	
You can use `convert` command to convert all your gif picture's frames into png pictures:

    convert -coalesce animation.gif animation.png

Make sure to install ImageMagick and ghostscript first, you can use brew to simplify process:

    brew install imagemagick
    brew install ghostscript

## How it looks ##

![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/TwitterMusic.gif)
![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/YahooWeather.gif)
![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Chrome.gif)
![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Universe.gif)
![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/MacOSX.gif)
![CHGifRefreshControl] (https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Windows.gif)

## Known issues ##

CHGifRefreshControl assumes the scrollView's `contentInset` is `UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f)` in iOS 7 and `UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)` in iOS 6. If this doesn't work for your project, you can modify the `originalContentInsectY` property in `CHGifRefreshControl` class. And I will make this step automatically later.

## Lincense ##

CHGifRefreshControl is available under the MIT license. See the LICENSE file for more info.
