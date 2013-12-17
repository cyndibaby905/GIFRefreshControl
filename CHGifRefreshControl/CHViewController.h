//
//  CHViewController.h
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 HangChen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    CHGifRefreshControlStyleTwitterMusic,
    CHGifRefreshControlStyleYahooWeather
}CHGifRefreshControlStyle;

@interface CHTableViewController : UITableViewController

@end

@interface CHViewController : UIViewController
@property (nonatomic, assign)CHGifRefreshControlStyle style;
@end
