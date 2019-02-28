//
//  AppDelegate.m
//  UINavigationController的创建及使用
//
//  Created by 雷维卡 on 2019/2/27.
//

#import "AppDelegate.h"
#import "ITViewController.h"
#import "ITTableViewController.h"
#import "ITCollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ITViewController alloc] init]];
    
    return YES;
}

@end
