//
//  AppDelegate.m
//  UITabBarController基本原理
//
//  Created by apple on 2019/4/23.
//

#import "AppDelegate.h"
#import "ITViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UITabBarController *barController = [[UITabBarController alloc] init];
    self.window.rootViewController = barController;
    // 向 UITabBarController 添加控制器
    ITViewController *purpleViewController = [[ITViewController alloc] init];
    [barController addChildViewController:purpleViewController];
    ITViewController *greenViewController = [[ITViewController alloc] initWithBackgroundColor:[UIColor greenColor]];
    [barController addChildViewController:greenViewController];
    ITViewController *redViewController = [[ITViewController alloc] initWithBackgroundColor:[UIColor redColor]];
    [barController addChildViewController:redViewController];
    // 手动设置显示的控制器
//    barController.selectedIndex = 2;
    // 设置每个控制器显示的按钮
    // 紫色
    purpleViewController.tabBarItem.title = @"紫色";
    purpleViewController.tabBarItem.badgeValue = @"12";
    // 绿色
    greenViewController.tabBarItem.title = @"绿色";
    greenViewController.tabBarItem.badgeValue = @"1";
    // 红色
    redViewController.tabBarItem.title = @"红色";
    barController.tabBar.tintColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
