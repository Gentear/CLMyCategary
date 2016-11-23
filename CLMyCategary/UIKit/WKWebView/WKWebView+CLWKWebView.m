//
//  WKWebView+CLWKWebView.m
//  CLMyCategary
//
//  Created by zyyt on 16/11/23.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "WKWebView+CLWKWebView.h"

@interface WKWebView()<UIGestureRecognizerDelegate>

@end

@implementation WKWebView (CLWKWebView)
- (void)cl_useSwipeGesture {
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cl_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeRight setNumberOfTouchesRequired:2];
    [swipeRight setDelegate:self];
    [self addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cl_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLeft setNumberOfTouchesRequired:2];
    [swipeLeft setDelegate:self];
    [self addGestureRecognizer:swipeLeft];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan setMaximumNumberOfTouches:2];
    [pan setMinimumNumberOfTouches:2];
    [self addGestureRecognizer:pan];
    
    [pan requireGestureRecognizerToFail:swipeLeft];
    [pan requireGestureRecognizerToFail:swipeRight];
}

- (void)cl_swipeRight:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoBack]) [self goBack];
}

- (void)cl_swipeLeft:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoForward]) [self goForward];
}
@end
