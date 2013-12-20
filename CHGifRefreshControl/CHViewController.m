//
//  CHViewController.m
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 Hang Chen (https://github.com/cyndibaby905)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "CHViewController.h"
#import "UIScrollView+GifPullToRefresh.h"
#define CHGIFAnimationDict @[\
@{@"name":@"Twitter Music Style",@"pattern":@"PullToRefresh_%03d.png",@"drawingStart":@0,@"drawingEnd":@73,@"loadingStart":@73,@"loadingEnd":@140},\
@{@"name":@"Yahoo! Weather Style",@"pattern":@"sun_%05d.png",@"drawingStart":@0,@"drawingEnd":@27,@"loadingStart":@42,@"loadingEnd":@109},\
@{@"name":@"Chrome Style",@"pattern":@"chrome-%d.png",@"drawingStart":@0,@"drawingEnd":@70,@"loadingStart":@70,@"loadingEnd":@107},\
@{@"name":@"Universe Style",@"pattern":@"stars-%d.png",@"drawingStart":@0,@"drawingEnd":@50,@"loadingStart":@50,@"loadingEnd":@84},\
@{@"name":@"Mac OSX Style",@"pattern":@"macOSX-%d.png",@"drawingStart":@0,@"drawingEnd":@63,@"loadingStart":@0,@"loadingEnd":@63},\
@{@"name":@"Windows Style",@"pattern":@"windows-%d.png",@"drawingStart":@0,@"drawingEnd":@24,@"loadingStart":@0,@"loadingEnd":@24}\
]


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
    __weak UIScrollView *tempScrollView = scrollView;
    
    [scrollView addPullToRefreshWithDrawingImgs:self.drawingImgs andLoadingImgs:self.loadingImgs andActionHandler:^{
        [tempScrollView performSelector:@selector(didFinishPullToRefresh) withObject:nil afterDelay:3];

    }];
    scrollView.alwaysBounceVertical = YES;
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation CHTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"GIF Refresh Control";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return CHGIFAnimationDict.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = CHGIFAnimationDict[indexPath.row][@"name"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CHViewController *controller = [[CHViewController alloc] init];
    NSMutableArray *drawingImgs = [NSMutableArray array];
    NSMutableArray *loadingImgs = [NSMutableArray array];
    NSUInteger drawingStart = [CHGIFAnimationDict[indexPath.row][@"drawingStart"] intValue];
    NSUInteger drawingEnd = [CHGIFAnimationDict[indexPath.row][@"drawingEnd"] intValue];
    NSUInteger laodingStart = [CHGIFAnimationDict[indexPath.row][@"loadingStart"] intValue];
    NSUInteger loadingEnd = [CHGIFAnimationDict[indexPath.row][@"loadingEnd"] intValue];
    
    for (NSUInteger i  = drawingStart; i <= drawingEnd; i++) {
        NSString *fileName = [NSString stringWithFormat:CHGIFAnimationDict[indexPath.row][@"pattern"],i];
        [drawingImgs addObject:[UIImage imageNamed:fileName]];
    }
    
    for (NSUInteger i  = laodingStart; i <= loadingEnd; i++) {
        NSString *fileName = [NSString stringWithFormat:CHGIFAnimationDict[indexPath.row][@"pattern"],i];
        [loadingImgs addObject:[UIImage imageNamed:fileName]];
    }
    controller.loadingImgs = loadingImgs;
    controller.drawingImgs = drawingImgs;
    controller.title = CHGIFAnimationDict[indexPath.row][@"name"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
