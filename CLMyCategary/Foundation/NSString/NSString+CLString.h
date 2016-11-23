//
//  NSString+CLPinYin.h
//  myCategary
//
//  Created by zyyt on 16/9/1.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CLString)
/**
 *  英文一个字节 中文两个字节
 */
-(NSUInteger)unicodeLengthOfString;
/**
 *  文字首字母
 *
 *  @return 首字母
 */
- (NSString *)CL_PINYINFirst;
/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)CL_heightWithFontSize:(NSInteger)fontSize  constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)CL_widthWithFontSize:(NSInteger)fontSize  constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)CL_heightWithFont:(UIFont *)font  constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)CL_widthWithFont:(UIFont *)font  constrainedToHeight:(CGFloat)height;
/**
 *  @brief  是否包含emoji
 *
 *  @return 是否包含emoji
 */
- (BOOL)CL_isIncludingEmoji;

/**
 *  @brief  删除掉包含的emoji
 *
 *  @return 清除后的string
 */
- (instancetype)CL_removedEmojiString;
/**
 *  @brief  去除空格
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)CL_removedSpace;
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)CL_dictionaryFromJsonString;
/**
    MD5加密
 */
- (NSString *)CL_MD5StringWithKey:(NSString *)key;
/**
 *  @brief  获取随机 UUID 例如 E621E1F8-C36C-495A-93FC-0C247A3E6E5F
 *
 *  @return 随机 UUID
 */
+ (NSString *)CL_UUID;
/**
 *
 *  @brief  毫秒时间戳 例如 1443066826371
 *
 *  @return 毫秒时间戳
 */
+ (NSString *)CL_UUIDTimestamp;
/**
 *  @brief  判断URL中是否包含中文
 *
 *  @return 是否包含中文
 */
- (BOOL)CL_isIncludeChinese;
/**
 *  @brief  是否包含空格
 *
 *  @return 是否包含空格
 */
- (BOOL)CL_isIncludingSpace;
/**
 *  手机号有效性
 */
- (BOOL)CL_isMobileNumber;

/**
 *  邮箱的有效性
 */
- (BOOL)CL_isEmailAddress;
/**
 *  网址有效性
 */
- (BOOL)CL_isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)CL_isValidChinese;
/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)CL_isValidWithMinLenth:(NSInteger)minLenth
                      maxLenth:(NSInteger)maxLenth
                containChinese:(BOOL)containChinese
           firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)CL_isValidWithMinLenth:(NSInteger)minLenth
                      maxLenth:(NSInteger)maxLenth
                containChinese:(BOOL)containChinese
                 containDigtal:(BOOL)containDigtal
                 containLetter:(BOOL)containLetter
         containOtherCharacter:(NSString *)containOtherCharacter
           firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
/**
 *  @brief  xml字符串转换成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)CL_XMLDictionary;
/**
 *  根据长度和制定字符分隔字符串
 *
 *  @param maxLength    最大长度
 *  @param complaceStr  分隔使用的字符
 *  @param languageCode 语言区分.。
 *
 */
- (NSArray *)CL_getString:(NSInteger)maxLength complaceStr:(NSString *)complaceStr languageCode:(NSString *)languageCode;
/**
 *  分隔字符并去空
 */
- (NSArray *)CL_stringExchangeArrayString:(NSString *)string;

/**
 *  去掉前后的空格和回车
 */
- (NSString *)CL_removeSpaceAndEnter;
@end
