//
//  ViewController.m
//  UIApplication类
//
//  Created by 雷维卡 on 2019/2/20.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)touchMe {
    UIApplication *app = UIApplication.sharedApplication;
    // 应用程序打开程序，调用 - (void)openURL:NSURL对象 options:<UIApplicationOpenExternalURLOptionsKey, id> 键值对字典 completionHandler:打开完成之后执行的方法。
    [app openURL:[NSURL URLWithString:@"https://www.baidu.com"] options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @NO} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"yes");
        } else {
            NSLog(@"no");
        }
    }];
    // 设置图标上的显示的通知数
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionProvidesAppNotificationSettings completionHandler:^(BOOL granted, NSError * _Nullable error) {
    }];
    NSSet<UNNotificationCategory *> *category = [NSSet setWithObjects:@"123", nil];
    [center setNotificationCategories:category];
    app.applicationIconBadgeNumber = 10;
}
@end
