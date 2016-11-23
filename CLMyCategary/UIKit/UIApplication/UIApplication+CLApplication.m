//
//  UIApplication+CLApplication.m
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UIApplication+CLApplication.h"
#import <objc/runtime.h>

//Import required frameworks
#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <EventKit/EventKit.h>

typedef void (^CLLocationSuccessCallback)();
typedef void (^CLLocationFailureCallback)();

static char CLPermissionsLocationManagerPropertyKey;
static char CLPermissionsLocationBlockSuccessPropertyKey;
static char CLPermissionsLocationBlockFailurePropertyKey;

@interface UIApplication () <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager *cl_permissionsLocationManager;
@property (nonatomic, copy) CLLocationSuccessCallback cl_locationSuccessCallbackProperty;
@property (nonatomic, copy) CLLocationFailureCallback cl_locationFailureCallbackProperty;
@end


@implementation UIApplication (CLApplication)

#pragma mark - Check permissions
-(CLPermissionAccess)cl_hasAccessToBluetoothLE {
    switch ([[[CBCentralManager alloc] init] state]) {
        case CBCentralManagerStateUnsupported:
            return CLPermissionAccessUnsupported;
            break;
            
        case CBCentralManagerStateUnauthorized:
            return CLPermissionAccessDenied;
            break;
            
        default:
            return CLPermissionAccessGranted;
            break;
    }
}

-(CLPermissionAccess)cl_hasAccessToCalendar {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent]) {
        case EKAuthorizationStatusAuthorized:
            return CLPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return CLPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return CLPermissionAccessRestricted;
            break;
            
        default:
            return CLPermissionAccessUnknown;
            break;
    }
}

-(CLPermissionAccess)cl_hasAccessToContacts {
    switch (ABAddressBookGetAuthorizationStatus()) {
        case kABAuthorizationStatusAuthorized:
            return CLPermissionAccessGranted;
            break;
            
        case kABAuthorizationStatusDenied:
            return CLPermissionAccessDenied;
            break;
            
        case kABAuthorizationStatusRestricted:
            return CLPermissionAccessRestricted;
            break;
            
        default:
            return CLPermissionAccessUnknown;
            break;
    }
}

-(CLPermissionAccess)cl_hasAccessToLocation {
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorizedAlways:
            return CLPermissionAccessGranted;
            break;
            
        case kCLAuthorizationStatusDenied:
            return CLPermissionAccessDenied;
            break;
            
        case kCLAuthorizationStatusRestricted:
            return CLPermissionAccessRestricted;
            break;
            
        default:
            return CLPermissionAccessUnknown;
            break;
    }
    return CLPermissionAccessUnknown;
}

-(CLPermissionAccess)cl_hasAccessToPhotos {
    switch ([ALAssetsLibrary authorizationStatus]) {
        case ALAuthorizationStatusAuthorized:
            return CLPermissionAccessGranted;
            break;
            
        case ALAuthorizationStatusDenied:
            return CLPermissionAccessDenied;
            break;
            
        case ALAuthorizationStatusRestricted:
            return CLPermissionAccessRestricted;
            break;
            
        default:
            return CLPermissionAccessUnknown;
            break;
    }
}

-(CLPermissionAccess)cl_hasAccessToReminders {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder]) {
        case EKAuthorizationStatusAuthorized:
            return CLPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return CLPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return CLPermissionAccessRestricted;
            break;
            
        default:
            return CLPermissionAccessUnknown;
            break;
    }
    return CLPermissionAccessUnknown;
}


#pragma mark - Request permissions
-(void)cl_requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)cl_requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    if(addressBook) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    accessGranted();
                } else {
                    accessDenied();
                }
            });
        });
    }
}

-(void)cl_requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    AVAudioSession *session = [[AVAudioSession alloc] init];
    [session requestRecordPermission:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)cl_requestAccessToMotionWithSuccess:(void(^)())accessGranted {
    CMMotionActivityManager *motionManager = [[CMMotionActivityManager alloc] init];
    NSOperationQueue *motionQueue = [[NSOperationQueue alloc] init];
    [motionManager startActivityUpdatesToQueue:motionQueue withHandler:^(CMMotionActivity *activity) {
        accessGranted();
        [motionManager stopActivityUpdates];
    }];
}

-(void)cl_requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        accessGranted();
    } failureBlock:^(NSError *error) {
        accessDenied();
    }];
}

-(void)cl_requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}


#pragma mark - Needs investigating
/*
 -(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted {
 //REQUIRES DELEGATE - NEEDS RETHINKING
 }
 */

-(void)cl_requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    self.cl_permissionsLocationManager = [[CLLocationManager alloc] init];
    self.cl_permissionsLocationManager.delegate = self;
    
    self.cl_locationSuccessCallbackProperty = accessGranted;
    self.cl_locationFailureCallbackProperty = accessDenied;
    [self.cl_permissionsLocationManager startUpdatingLocation];
}


#pragma mark - Location manager injection
-(CLLocationManager *)cl_permissionsLocationManager {
    return objc_getAssociatedObject(self, &CLPermissionsLocationManagerPropertyKey);
}

-(void)setCl_permissionsLocationManager:(CLLocationManager *)manager {
    objc_setAssociatedObject(self, &CLPermissionsLocationManagerPropertyKey, manager, OBJC_ASSOCIATION_RETAIN);
}

-(CLLocationSuccessCallback)locationSuccessCallbackProperty {
    return objc_getAssociatedObject(self, &CLPermissionsLocationBlockSuccessPropertyKey);
}

-(void)setCl_locationSuccessCallbackProperty:(CLLocationSuccessCallback)locationCallbackProperty {
    objc_setAssociatedObject(self, &CLPermissionsLocationBlockSuccessPropertyKey, locationCallbackProperty, OBJC_ASSOCIATION_COPY);
}

-(CLLocationFailureCallback)locationFailureCallbackProperty {
    return objc_getAssociatedObject(self, &CLPermissionsLocationBlockFailurePropertyKey);
}

-(void)setCl_locationFailureCallbackProperty:(CLLocationFailureCallback)locationFailureCallbackProperty {
    objc_setAssociatedObject(self, &CLPermissionsLocationBlockFailurePropertyKey, locationFailureCallbackProperty, OBJC_ASSOCIATION_COPY);
}


#pragma mark - Location manager delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorized) {
        self.locationSuccessCallbackProperty();
    } else if (status != kCLAuthorizationStatusNotDetermined) {
        self.locationFailureCallbackProperty();
    }
}

@end

