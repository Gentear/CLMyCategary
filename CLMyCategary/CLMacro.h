//代码块，名称和传参，没有传参就不填
#define Block_(name,...) \
    cl_set_block(void,name,__VA_ARGS__)
//有返回值的代码块
#define BlockReturn_(name,returnClass,...) \
    cl_set_block(returnClass,name,__VA_ARGS__)

//防止block的强硬用循环相关
#define CLWeak(arg) \
    __weak typeof(arg) wArg = arg;
#define CLStrong(arg) \
    __strong typeof(wArg) arg = wArg;

#define CLWeakSelf \
    CLWeak(self)
#define CLStrongSelf \
    CLStrong(self)
//delegate
#define CLDelegate(select,clSelected) \
if([self.delegate respondsToSelector:@selector(arg)]){\clSelected;}
//字符串是否为空
#define CLStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define CLArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define CLDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//是否是空对象
#define CLObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//获取屏幕宽度与高度
#define CLScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define CLScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define CLScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

//一些缩写
#define CLApplication        [UIApplication sharedApplication]
#define CLKeyWindow          [UIApplication sharedApplication].keyWindow
#define CLAppDelegate        [UIApplication sharedApplication].delegate
#define CLUserDefaults       [NSUserDefaults standardUserDefaults]
#define CLNotificationCenter [NSNotificationCenter defaultCenter]

/**
 *  APP版本号
 */
#define CLAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define CLSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define CLCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define CLISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define CLISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define CLDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define CLTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define CLCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

//开发的时候打印，但是发布的时候不打印的NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

//颜色
#define CLRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CLRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define CLRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
/**
 *  16进制颜色
 */
#define CLColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//由角度转换弧度
#define CLDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define CLRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define CLStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define CLEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)


/*
 *  json转字典
 */
CG_INLINE NSDictionary *dictionaryFromJsonString(NSString *jsonString){
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"json解析失败 : %@", error);
        return nil;
    }
    return dic;
}
/*
 *  字典转成json
 */
CG_INLINE NSString *JsonStringFromDictionary(NSDictionary *dic){
    if (dic == nil) {
        return nil;
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"字典转换失败 : %@", error);
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
/**
 *  添加的categary
 */
#import "CALayer+CLLayer.h"
#import "CADisplayLink+YJDisLink.h"

#import "NSTimer+CLTimer.h"
#import "NSObject+CLObject.h"
#import "NSString+CLString.h"
#import "NSArray+CLArray.h"
#import "NSDictionary+CLDictionary.h"

#import "UIWebView+CLWebView.h"
#import "WKWebView+CLWKWebView.h"
#import "UIDevice+CLDevice.h"
#import "UIWindow+CLWindow.h"
#import "UIApplication+CLApplication.h"
#import "UIControl+CLControl.h"
#import "UITextView+CLTextView.h"
#import "UIViewController+CLViewController.h"
#import "UILabel+CLLabel.h"
#import "UITabBarController+CLTabBarController.h"
#import "UIBezierPath+CLBezierPath.h"
#import "UIButton+CLActivityBtn.h"
#import "UIButton+CLButton.h"
#import "FullyHorizontalFlowLayout.h"
#import "LXReorderableCollectionViewFlowLayout.h"
#import "UICollectionView+CLCollectionView.h"
#import "UIColor+CLColor.h"
#import "UIImage+CLImage.h"
#import "UIImageView+CLImageView.h"
#import "UIImageView+CLNameImage.h"
#import "UINavigationBar+CLNavigationBar.h"
#import "UIScrollView+CLScrollView.h"
#import "UITableView+CLTableView.h"
#import "UITextField+CLTextField.h"
#import "UIView+CLView.h"
#import "UIView+CLBadgeView.h"
#import "UIView+CLShake.h"
#import "UIView+KeyboardObserver.h"





