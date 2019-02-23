//
//  ViewController.m
//  UIApplication类
//
//  Created by 雷维卡 on 2019/2/20.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface ViewController () <UNUserNotificationCenterDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)touchMe {
    UIApplication *app = UIApplication.sharedApplication;
    // 应用程序打开程序，调用 - (void)openURL:NSURL对象 options:<UIApplicationOpenExternalURLOptionsKey, id> 键值对字典 completionHandler:打开完成之后执行的代码块（该代码块将会异步执行在主线程当中）。
    [app openURL:[NSURL URLWithString:@"https://www.baidu.com"] options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @YES} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"yes");
        } else {
            NSLog(@"no");
        }
    }];
    // 设置图标上的显示的通知数
    /*
     当设置图标上的通知数的时候，需要导入用户通知框架（#import <UserNotifications/UserNotifications.h>）因为手机上边的小红标意味着通知数量。而在 iOS 10 以上的版本当中，不管本地通知还是远程通知全部都由 UserNotification 框架来进行管理，原有方法作废。
     当创建好控制中心以后，需要为控制中心注册认证（即需要向用户索取什么权限，索取完以后在非主线程异步处理事件）。
     */
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionProvidesAppNotificationSettings completionHandler:^(BOOL granted, NSError * _Nullable error) {
    }];
    UNNotificationAction *action = [UNNotificationAction actionWithIdentifier:@"id" title:@"今日大事" options:UNNotificationActionOptionNone];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"id" actions:@[action] intentIdentifiers:@[@"nil"] options:UNNotificationCategoryOptionNone];
    NSSet<UNNotificationCategory *> *categorySet = [NSSet setWithObjects:category, nil];
    [center setNotificationCategories:categorySet];
    app.applicationIconBadgeNumber = 10;
    app.networkActivityIndicatorVisible = !app.isNetworkActivityIndicatorVisible;
}

@end
