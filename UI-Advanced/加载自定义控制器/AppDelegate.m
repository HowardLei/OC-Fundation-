//
//  AppDelegate.m
//  加载自定义控制器
//
//  Created by apple on 2019/2/24.
//

#import "AppDelegate.h"
#import "ITViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 当创建一个自定义控制器的时候，需要实现一下几步。（没有 xib 文件的时候）
    /*
     1. 先将原有的控制器与控制器有关的 plist 文件当中全部的数据清理
     2. 创建自定义控制器类，继承自 UIViewController
     3. 将自定义的控制器设置到代理类的代理加载方法当中
     4. 初始化代理对象的窗口属性，窗口大小为当前屏幕的大小（注意：在代理方法当中没有 view 属性，不能设置为 self.view.bounds）
     5. 初始化代理对象窗口的根控制器为自定义控制器对象
     6. 让当前窗口为keyWindow 并且可见。（注意：设置当前窗口为 keyWindow 不代表它是可见的，需要调用方法来设置）
     */
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ITViewController alloc] init];
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
