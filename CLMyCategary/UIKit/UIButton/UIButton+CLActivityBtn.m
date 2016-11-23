//
//  UIButton+CLActivityBtn.m
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UIButton+CLActivityBtn.h"
#import  <objc/runtime.h>
static const void *cl_UIButtonBlockKey = &cl_UIButtonBlockKey;
@interface UIButton ()

@property(nonatomic, strong) UIView *cl_modalView;
@property(nonatomic, strong) UIActivityIndicatorView *cl_spinnerView;

@end

@implementation UIButton (CLActivityBtn)

- (void)cl_beginSubmitting:(UIActivityIndicatorViewStyle)style {
    [self cl_endSubmitting];
    
    self.cl_submitting = @YES;
    self.hidden = YES;
    
    self.cl_modalView = [[UIView alloc] initWithFrame:self.frame];
    self.cl_modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.cl_modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.cl_modalView.layer.borderWidth = self.layer.borderWidth;
    self.cl_modalView.layer.borderColor = self.layer.borderColor;
    
//    CGRect viewBounds = self.cl_modalView.bounds;
    self.cl_spinnerView = [[UIActivityIndicatorView alloc]
                           initWithActivityIndicatorStyle:style];
    self.cl_spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.cl_spinnerView.bounds;
    self.cl_spinnerView.frame = CGRectMake(
                                           0, 0,
                                           spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    [self.cl_modalView addSubview:self.cl_spinnerView];
    [self.superview addSubview:self.cl_modalView];
    [self.cl_spinnerView startAnimating];
}

- (void)cl_endSubmitting {
    if (!self.isCLSubmitting.boolValue) {
        return;
    }
    
    self.cl_submitting = @NO;
    self.hidden = NO;
    
    [self.cl_modalView removeFromSuperview];
    self.cl_modalView = nil;
    self.cl_spinnerView = nil;

}

- (NSNumber *)isCLSubmitting {
    return objc_getAssociatedObject(self, @selector(setCl_submitting:));
}

- (void)setCl_submitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setCl_submitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)cl_spinnerView {
    return objc_getAssociatedObject(self, @selector(setCl_spinnerView:));
}

- (void)setCl_spinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setCl_spinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cl_modalView {
    return objc_getAssociatedObject(self, @selector(setCl_modalView:));
    
}

- (void)setCl_modalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setCl_modalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//----------
-(void)cl_addTargeActionHandler:(CLTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, cl_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(cl_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cl_blockActionTouched:(UIButton *)btn{
    CLTouchedButtonBlock block = objc_getAssociatedObject(self, cl_UIButtonBlockKey);
    if (block) {
        block(btn,btn.tag);
    }
}
@end