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
    [self usingStoryboardCreateViewController];
    return YES;
}
/**
 用代码创建控制器
 */
- (void)usingCodeToCreateViewController {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ITViewController alloc] init];
}
/**
 用 storyboard 创建控制器
 */
- (void)usingStoryboardCreateViewController {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 注意：设置 rootController 有两种设置方法
    /*
     第一种：在 storyboard 上设置成初始化启动器。代码设置步骤如下：
        1. 
     第二种：在 storyboard 的控制器里面设置 Storyboard ID 即可。
     */
    self.window.rootViewController = [board instantiateInitialViewController];
}
@end
