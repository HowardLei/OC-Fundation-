//
//  AppDelegate.m
//  3种方式创建控制器
//
//  Created by apple on 2019/2/24.
//

#import "AppDelegate.h"
#import "ITViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self usingCodeToCreateViewController];
    return YES;
}
- (void)usingCodeToCreateViewController {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ITViewController alloc] init];
}
@end
