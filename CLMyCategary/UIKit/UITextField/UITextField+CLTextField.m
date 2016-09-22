//
//  UITcltField+CLTcltField.m
//  myCategary
//
//  Created by zyyt on 16/9/12.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import "UITextField+CLTextField.h"
#import <objc/runtime.h>

static char kMaxLength;

@interface UItextFieldMaxLengthObserver : NSObject

@end

@implementation UItextFieldMaxLengthObserver

- (void)textChange:(UITextField *)textField {
    NSString *destText = textField.text;
    NSUInteger maxLength = textField.maxLength;
    
    // 对中文的特殊处理，shouldChangeCharactersInRangeWithReplacementString 并不响应中文输入法的选择事件
    // 如拼音输入时，拼音字母处于选中状态，此时不判断是否超长
    UITextRange *selectedRange = [textField markedTextRange];
    if (!selectedRange || !selectedRange.start) {
        if (destText.length > maxLength) {
            textField.text = [destText substringToIndex:maxLength];
        }
    }
}


@end

static UItextFieldMaxLengthObserver *observer;
static char clCanMoveKey;
static char clMoveViewKey;
static char clHeightToKeyboardKey;
static char clInitialYKey;
static char clTapGestureKey;
static char clKeyboardYKey;
static char clTotalHeightKey;
static char clKeyboardHeightKey;
static char clHasContentOffsetKey;
static char clKeyboardFrameBeginToEndKey;

@implementation UITextField (CLTextField)
@dynamic cl_canMove;
@dynamic cl_moveView;
@dynamic cl_heightToKeyboard;

/**
 * 初始化交换Selector
 **/
+ (void)load {
    static dispatch_once_t onceTokenTextField;
    dispatch_once(&onceTokenTextField, ^{
        SEL systemSelector = @selector(initWithFrame:);
        SEL mySystemSelector = @selector(setClTextFieldInitWithFrame:);
        [self exchangeSystemSelector:systemSelector bySel:mySystemSelector];
        
        SEL becomeFirst = @selector(becomeFirstResponder);
        SEL myBecomeFirst = @selector(newClTextFieldBecomeFirstResponder);
        [self exchangeSystemSelector:becomeFirst bySel:myBecomeFirst];
        
        SEL resignFirst = @selector(resignFirstResponder);
        SEL myResignFirst = @selector(newClTextFieldResignFirstResponder);
        [self exchangeSystemSelector:resignFirst bySel:myResignFirst];
        
        SEL selInitCoder = @selector(initWithCoder:);
        SEL mySelInitCoder = @selector(setClTextFieldInitWithCoder:);
        [self exchangeSystemSelector:selInitCoder bySel:mySelInitCoder];
        observer = [[UItextFieldMaxLengthObserver alloc] init];

    });
    [super load];
}
/**
 * 设置交换方法
 **/
+ (void)exchangeSystemSelector:(SEL)systemSel bySel:(SEL)mySel {
    Method systemMethod = class_getInstanceMethod([self class], systemSel);
    Method myMethod = class_getInstanceMethod([self class], mySel);
    //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
    BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    if (isAdd) {
        //如果成功，说明类中不存在这个方法的实现
        //将被交换方法的实现替换到这个并不存在的实现
        class_replaceMethod(self, mySel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        //否则，交换两个方法的实现
        method_exchangeImplementations(systemMethod, myMethod);
    }
}

- (instancetype)setClTextFieldInitWithCoder:(NSCoder *)aDecoder {
    [self setClTextFieldInit];
    return [self setClTextFieldInitWithCoder:aDecoder];
}

- (instancetype)setClTextFieldInitWithFrame:(CGRect)frame {
    [self setClTextFieldInit];
    return [self setClTextFieldInitWithFrame:frame];
}
/**
 * 初始化init
 **/
- (void)setClTextFieldInit {
    self.cl_heightToKeyboard = 10;
    self.cl_canMove = YES;
    self.clKeyboardY = 0;
    self.clTotalHeight = 0;
    self.clTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
}
/**
 *  接收键盘的显示的通知
 **/
- (void)notificationShowKeyboardAction:(NSNotification *)sender {
    //       NSLog(@"%@", sender);
    if (!self.cl_canMove) {
        return;
    }
    self.clKeyboardY = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    self.clKeyboardHeight = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    CGRect begins = [[[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect end = [[[sender userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if ((begins.origin.y-end.origin.y<0) && duration == 0){
        self.clKeyboardFrameBeginToEnd = begins.origin.y - end.origin.y;
    }else{
        self.clKeyboardFrameBeginToEnd  = 0;
    }
    [self clKeyboardDidShow];
}

- (void)clKeyboardDidShow {
    if (self.clKeyboardHeight == 0) {
        return;
    }
    CGFloat fieldYInWindow = [self convertPoint:self.bounds.origin toView:[UIApplication sharedApplication].keyWindow].y;
    CGFloat height = (fieldYInWindow + self.cl_heightToKeyboard + self.frame.size.height) - self.clKeyboardY;
    CGFloat moveHeight = height > 0 ? height : 0;
    moveHeight = self.clKeyboardFrameBeginToEnd < 0?self.clKeyboardFrameBeginToEnd:moveHeight;
    if (height < 0  && moveHeight < 0) {
        if (fabs(height)>fabs(moveHeight)) {
            return;
        }
    }
    [UIView animateWithDuration:0.25 animations:^{
        if (self.clhasContentOffset) {
            UIScrollView *scrollView = (UIScrollView *)self.cl_moveView;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + moveHeight);
        } else {
            CGRect rect = self.cl_moveView.frame;
            self.clInitialY = rect.origin.y;
            rect.origin.y -= moveHeight;
            self.cl_moveView.frame = rect;
        }
        self.clTotalHeight += moveHeight;
    }];
}
/**
 *  接收键盘的隐藏的通知
 **/
- (void)notificationHideKeyboardAction:(NSNotification *)sender {
    if (!self.cl_canMove || self.clKeyboardY == 0) {
        return;
    }
    [self clHideKeyBoard:0.25];
}

- (void)clHideKeyBoard:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        if (self.clhasContentOffset) {
            UIScrollView *scrollView = (UIScrollView *)self.cl_moveView;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y - self.clTotalHeight);
        } else {
            CGRect rect = self.cl_moveView.frame;
            rect.origin.y += self.clTotalHeight;
            self.cl_moveView.frame = rect;
        }
        self.clTotalHeight = 0;
    }];
}
/**
 * 获取 TcltField 的焦点
 **/
- (BOOL)newClTextFieldBecomeFirstResponder {
    if (self.cl_moveView == nil) {
        self.cl_moveView = [self viewController].view;
    }
    if (![self.cl_moveView.gestureRecognizers containsObject:self.clTapGesture]) {
        [self.cl_moveView addGestureRecognizer:self.clTapGesture];
    }
    if ([self isFirstResponder] || !self.cl_canMove) {
        return [self newClTextFieldBecomeFirstResponder];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationShowKeyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHideKeyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    return [self newClTextFieldBecomeFirstResponder];
}
/**
 * 取消 TcltField 的焦点
 **/
- (BOOL)newClTextFieldResignFirstResponder {
    if ([self.cl_moveView.gestureRecognizers containsObject:self.clTapGesture]) {
        [self.cl_moveView removeGestureRecognizer:self.clTapGesture];
    }
    if (!self.cl_canMove) {
        return [self newClTextFieldResignFirstResponder];
    }
    BOOL result = [self newClTextFieldResignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [self clHideKeyBoard:0];
    return result;
}

- (void)tapAction {
    [[self viewController].view endEditing:YES];
}

- (UIViewController *)viewController {
    UIView *next = self;
    while (1) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
        next = next.superview;
    }
    return nil;
}

#pragma mark - 对外接口

- (void)setCl_canMove:(BOOL)cl_canMove {
    objc_setAssociatedObject(self, &clCanMoveKey, @(cl_canMove), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)cl_canMove {
    return [objc_getAssociatedObject(self, &clCanMoveKey) boolValue];
}

- (void)setCl_heightToKeyboard:(CGFloat)cl_heightToKeyboard {
    objc_setAssociatedObject(self, &clHeightToKeyboardKey, @(cl_heightToKeyboard), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)cl_heightToKeyboard {
    return [objc_getAssociatedObject(self, &clHeightToKeyboardKey) floatValue];
}

- (void)setCl_moveView:(UIView *)cl_moveView {
    self.clhasContentOffset = NO;
    if ([cl_moveView isKindOfClass:[UIScrollView class]]) {
        self.clhasContentOffset = YES;
    }
    objc_setAssociatedObject(self, &clMoveViewKey, cl_moveView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cl_moveView {
    return objc_getAssociatedObject(self, &clMoveViewKey);
}

#pragma mark - 初始化属性 私有方法
- (void)setClInitialY:(CGFloat)clInitialY {
    objc_setAssociatedObject(self, &clInitialYKey, @(clInitialY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)clInitialY {
    return [objc_getAssociatedObject(self, &clInitialYKey) floatValue];
}

- (void)setClTapGesture:(UITapGestureRecognizer *)clTapGesture {
    objc_setAssociatedObject(self, &clTapGestureKey, clTapGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)clTapGesture {
    return objc_getAssociatedObject(self, &clTapGestureKey);
}

- (void)setClKeyboardY:(CGFloat)clKeyboardY {
    objc_setAssociatedObject(self, &clKeyboardYKey, @(clKeyboardY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)clKeyboardY {
    return [objc_getAssociatedObject(self, &clKeyboardYKey) floatValue];
}

- (void)setClTotalHeight:(CGFloat)clTotalHeight {
    objc_setAssociatedObject(self, &clTotalHeightKey, @(clTotalHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)clTotalHeight {
    return [objc_getAssociatedObject(self, &clTotalHeightKey) floatValue];
}

- (void)setClKeyboardFrameBeginToEnd:(CGFloat)clKeyboardFrameBeginToEnd {
    objc_setAssociatedObject(self, &clKeyboardFrameBeginToEndKey, @(clKeyboardFrameBeginToEnd), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)clKeyboardFrameBeginToEnd {
    return [objc_getAssociatedObject(self, &clKeyboardFrameBeginToEndKey) floatValue];
}

- (void)setClKeyboardHeight:(CGFloat)clKeyboardHeight {
    objc_setAssociatedObject(self, &clKeyboardHeightKey, @(clKeyboardHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)clKeyboardHeight {
    return [objc_getAssociatedObject(self, &clKeyboardHeightKey) floatValue];
}

- (void)setClhasContentOffset:(BOOL)clhasContentOffset {
    objc_setAssociatedObject(self, &clHasContentOffsetKey, @(clhasContentOffset), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)clhasContentOffset {
    return [objc_getAssociatedObject(self, &clHasContentOffsetKey) boolValue];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

@dynamic maxLength;

- (void)setMaxLength:(NSUInteger)maxLength {
    objc_setAssociatedObject(self, &kMaxLength, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (maxLength) {
        [self addTarget:observer
                 action:@selector(textChange:)
       forControlEvents:UIControlEventEditingChanged];
    }
}

-(NSUInteger)maxLength {
    NSNumber *number = objc_getAssociatedObject(self, &kMaxLength);
    return [number integerValue];
}

@end
