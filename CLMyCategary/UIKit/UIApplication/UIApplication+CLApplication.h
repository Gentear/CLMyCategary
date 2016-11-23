//
//  UIApplication+CLApplication.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

typedef enum {
    CLPermissionTypeBluetoothLE,
    CLPermissionTypeCalendar,
    CLPermissionTypeContacts,
    CLPermissionTypeLocation,
    CLPermissionTypeMicrophone,
    CLPermissionTypeMotion,
    CLPermissionTypePhotos,
    CLPermissionTypeReminders,
} CLPermissionType;

typedef enum {
    CLPermissionAccessDenied, //User has rejected feature
    CLPermissionAccessGranted, //User has accepted feature
    CLPermissionAccessRestricted, //Blocked by parental controls or system settings
    CLPermissionAccessUnknown, //Cannot be determined
    CLPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    CLPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} CLPermissionAccess;

@interface UIApplication (CLApplication)

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(CLPermissionAccess)cl_hasAccessToBluetoothLE;
-(CLPermissionAccess)cl_hasAccessToCalendar;
-(CLPermissionAccess)cl_hasAccessToContacts;
-(CLPermissionAccess)cl_hasAccessToLocation;
-(CLPermissionAccess)cl_hasAccessToPhotos;
-(CLPermissionAccess)cl_hasAccessToReminders;

//Request permission with callback
/**
 *  日历
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  网络
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  麦克
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  照片
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  通知
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 * 位置
 *
 *  @param accessGranted <#accessGranted description#>
 *  @param accessDenied  <#accessDenied description#>
 */
-(void)cl_requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  运动
 *
 *  @param accessGranted <#accessGranted description#>
 */
-(void)cl_requestAccessToMotionWithSuccess:(void(^)())accessGranted;

//Needs investigating - unsure whether it can be implemented because of required delegate callbacks
//-(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted;

@end
