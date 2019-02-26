//
//  AppDelegate.m
//  通过xib加载控制器
//
//  Created by apple on 2019/2/26.
//

#import "AppDelegate.h"
#import "ITViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ITViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
