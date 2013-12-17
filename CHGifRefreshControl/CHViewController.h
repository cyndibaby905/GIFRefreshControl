//
//  CHViewController.h
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 HangChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTableViewController : UITableViewController

@end

@interface CHViewController : UIViewController
@property (nonatomic, strong)NSArray *loadingImgs;
@property (nonatomic, strong)NSArray *drawingImgs;
@end
