

/**
 *     便捷定义@property属性
 */
/** copy */

//NSString
#define String_(name) \
    cl_copy_property(NSString*,name)
//NSArray
#define Array_(name) \
    cl_copy_property(NSArray*,name)
//NSDictionary
#define Dictionary_(name) \
    cl_copy_property(NSDictionary*,name)
//NSNumber,它没用对应的不可变类，其实用copy或strong没有区别
#define Number_(name) \
    cl_copy_property(NSNumber*,name)
//NSData
#define Data_(name) \
    cl_copy_property(NSData*,name)
//NSSet
#define Set_(name) \
    cl_copy_property(NSSet*,name)
//NSIndexSet
#define IndexSet_(name) \
    cl_copy_property(NSIndexSet*,name)

//代码块，名称和传参，没有传参就不填
#define Block_(name,...) \
    cl_set_block(void,name,__VA_ARGS__)
//有返回值的代码块
#define BlockReturn_(name,returnClass,...) \
    cl_set_block(returnClass,name,__VA_ARGS__)






/** strong */

//NSMutableString
#define mString_(name,...) \
    cl_strong_property(NSMutableString*,name,__VA_ARGS__)
//NSMutableArray
#define mArray_(name,...) \
    cl_strong_property(NSMutableArray*,name,__VA_ARGS__)
//NSMutableDictionary
#define mDictionary_(name,...) \
    cl_strong_property(NSMutableDictionary*,name,__VA_ARGS__)
//NSMutableData
#define mData_(name,...) \
    cl_strong_property(NSMutableData*,name,__VA_ARGS__)
//NSMutableSet
#define mSet_(name,...) \
    cl_strong_property(NSMutableSet*,name,__VA_ARGS__)
//NSMutableIndexSet
#define mIndexSet_(name,...) \
    cl_strong_property(NSMutableIndexSet*,name,__VA_ARGS__)

//UIImage
#define Image_(name) \
    cl_strong_property(UIImage*,name)
//UIColor
#define Color_(name) \
    cl_strong_property(UIColor*,name)
//id
#define id_(name,...) \
    cl_strong_property(id,name,__VA_ARGS__)

//UIView
#define View_(name,...) \
    cl_strong_property(UIView*,name,__VA_ARGS__)
//UIImageView
#define ImageView_(name,...) \
    cl_strong_property(UIImageView*,name,__VA_ARGS__)
//UILabel
#define Label_(name,...) \
    cl_strong_property(UILabel*,name,__VA_ARGS__)
//UIButton
#define Button_(name,...) \
    cl_strong_property(UIButton*,name,__VA_ARGS__)
//UITableView
#define TableView_(name,...) \
    cl_strong_property(UITableView*,name,__VA_ARGS__)
//UICollectionView
#define CollectionView_(name,...) \
    cl_strong_property(UICollectionView*,name,__VA_ARGS__)
//UISegmentedControl
#define SegmentedControl_(name,...) \
    cl_strong_property(UISegmentedControl*,name,__VA_ARGS__)
//UITextField
#define TextField_(name,...) \
    cl_strong_property(UITextField*,name,__VA_ARGS__)
//UISlider
#define Slider_(name,...) \
    cl_strong_property(UISlider*,name,__VA_ARGS__)
//UISwitch
#define Switch_(name,...) \
    cl_strong_property(UISwitch*,name,__VA_ARGS__)
//UIActivityIndicatorView
#define ActivityIndicatorView_(name,...) \
    cl_strong_property(UIActivityIndicatorView*,name,__VA_ARGS__)
//UIProgressView
#define ProgressView_(name,...) \
    cl_strong_property(UIProgressView*,name,__VA_ARGS__)
//UIPageControl
#define PageControl_(name,...) \
    cl_strong_property(UIPageControl*,name,__VA_ARGS__)
//UIStepper
#define Stepper_(name,...) \
    cl_strong_property(UIStepper*,name,__VA_ARGS__)
//UITextView
#define TextView_(name,...) \
    cl_strong_property(UITextView*,name,__VA_ARGS__)
//UIScrollView
#define ScrollView_(name,...) \
    cl_strong_property(UIScrollView*,name,__VA_ARGS__)
//UIDatePicker
#define DatePicker_(name,...) \
    cl_strong_property(UIDatePicker*,name,__VA_ARGS__)
//UIPickerView
#define PickerView_(name,...) \
    cl_strong_property(UIPickerView*,name,__VA_ARGS__)
//UIWebView
#define WebView_(name,...) \
    cl_strong_property(UIWebView*,name,__VA_ARGS__)
//自定义类
#define DIYObj_(class,name,...) \
    cl_strong_property(class*,name,__VA_ARGS__)





/** assign */

//int
#define int_(name,...) \
    cl_assign_property(int,name,__VA_ARGS__)
//float
#define float_(name,...) \
    cl_assign_property(float,name,__VA_ARGS__)
//double
#define double_(name,...) \
    cl_assign_property(double,name,__VA_ARGS__)
//CGFloat
#define CGFloat_(name,...) \
    cl_assign_property(CGFloat,name,__VA_ARGS__)
//NSInteger
#define NSInteger_(name,...) \
    cl_assign_property(NSInteger,name,__VA_ARGS__)
//NSUInteger
#define NSUInteger_(name,...) \
    cl_assign_property(NSUInteger,name,__VA_ARGS__)
//BOOL
#define BOOL_(name,...) \
    cl_assign_property(BOOL,name,__VA_ARGS__)
//CGRect
#define CGRect_(name,...) \
    cl_assign_property(CGRect,name,__VA_ARGS__)
//CGSize
#define CGSize_(name,...) \
    cl_assign_property(CGSize,name,__VA_ARGS__)
//CGPoint
#define CGPoint_(name,...) \
    cl_assign_property(CGPoint,name,__VA_ARGS__)
//CGAffineTransform
#define CGAffineTransform_(name,...) \
    cl_assign_property(CGAffineTransform,name,__VA_ARGS__)
//NSTimeInterval
#define NSTimeInterval_(name,...) \
    cl_assign_property(NSTimeInterval,name,__VA_ARGS__)
//Class
#define Class_(name) \
    cl_assign_property(Class,name)




/** weak */

//UIImageView
#define weakImageView_(name,...) \
    cl_weak_property(UIImageView*,name,__VA_ARGS__)
//UIView
#define weakView_(name,...) \
    cl_weak_property(UIView*,name,__VA_ARGS__)
//UILabel
#define weakLabel_(name,...) \
    cl_weak_property(UILabel*,name,__VA_ARGS__)
//UIButton
#define weakButton_(name,...) \
    cl_weak_property(UIButton*,name,__VA_ARGS__)
//UITableView
#define weakTableView_(name,...) \
    cl_weak_property(UITableView*,name,__VA_ARGS__)
//UICollectionView
#define weakCollectionView_(name,...) \
    cl_weak_property(UICollectionView*,name,__VA_ARGS__)
//UISegmentedControl
#define weakSegmentedControl_(name,...) \
    cl_weak_property(UISegmentedControl*,name,__VA_ARGS__)
//UITextField
#define weakTextField_(name,...) \
    cl_weak_property(UITextField*,name,__VA_ARGS__)
//UISlider
#define weakSlider_(name,...) \
    cl_weak_property(UISlider*,name,__VA_ARGS__)
//UISwitch
#define weakSwitch_(name,...) \
    cl_weak_property(UISwitch*,name,__VA_ARGS__)
//UIActivityIndicatorView
#define weakActivityIndicatorView_(name,...) \
    cl_weak_property(UIActivityIndicatorView*,name,__VA_ARGS__)
//UIProgressView
#define weakProgressView_(name,...) \
    cl_weak_property(UIProgressView*,name,__VA_ARGS__)
//UIPageControl
#define weakPageControl_(name,...) \
    cl_weak_property(UIPageControl*,name,__VA_ARGS__)
//UIStepper
#define weakStepper_(name,...) \
    cl_weak_property(UIStepper*,name,__VA_ARGS__)
//UITextView
#define weakTextView_(name,...) \
    cl_weak_property(UITextView*,name,__VA_ARGS__)
//UIScrollView
#define weakScrollView_(name,...) \
    cl_weak_property(UIScrollView*,name,__VA_ARGS__)
//UIDatePicker
#define weakDatePicker_(name,...) \
    cl_weak_property(UIDatePicker*,name,__VA_ARGS__)
//UIPickerView
#define weakPickerView_(name,...) \
    cl_weak_property(UIPickerView*,name,__VA_ARGS__)
//UIWebView
#define weakWebView_(name,...) \
    cl_weak_property(UIWebView*,name,__VA_ARGS__)
//自定义类
#define weakDIYObj_(class,name,...) \
    cl_weak_property(class*,name,__VA_ARGS__)

//delegate
#define Delegate_(class,name) \
    cl_weak_property(id<class>,name)


/** base */

//copy && DIY
#define cl_copy_property(class,var,...) \
    cl_set_property(class,var,copy,__VA_ARGS__)
//strong && DIY
#define cl_strong_property(class,var,...) \
    cl_set_property(class,var,strong,__VA_ARGS__)
//weak && DIY
#define cl_weak_property(class,var,...) \
    cl_set_property(class,var,weak,__VA_ARGS__)
//assign && DIY
#define cl_assign_property(class,var,...) \
    cl_set_property(class,var,assign,__VA_ARGS__)
//DIY
#define cl_diy_property(class,var,...) \
    cl_set_property(class,var,__VA_ARGS__)
//block
#define cl_set_block(class,name,...) \
    cl_set_property(class,(^name)(__VA_ARGS__),copy)

//baseMacro
#define cl_set_property(class,var,...) \
    @property (nonatomic, __VA_ARGS__) class var;


/**
 *     其他宏
 */

//block的调用
#define Call(block,...) \
    !block?:block(__VA_ARGS__);
//block的调用，并带有返回值
#define CallRerurn(block,failReturnValue,...) \
    block?(block(__VA_ARGS__)):(failReturnValue)

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
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//获取屏幕宽度与高度
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

/**
 *  APP版本号
 *
 *  @param objectAtIndex:0] <#objectAtIndex:0] description#>
 *
 *  @return <#return value description#>
 */
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

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
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)

#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
/**
 *  添加的categary
 */
#import "NSString+CLString.h"
#import "NSArray+CLArray.h"
#import "NSObject+CLObject.h"
#import "NSDictionary+CLDictionary.h"
#import "UIButton+CLCategory.h"
#import "UIColor+CLColor.h"
#import "UIBezierPath+CLBezierPath.h"
#import "UITextField+CLTextField.h"
#import "UIView+CLView.h"
#import "UIView+CLBadgeView.h"

