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
//    [self usingStoryboardCreateViewController];
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
        1. 创建一个 UIStoryboard 对象
        2. 调用 UIStoryboard 对象的 - (nullable __kindof UIViewController *)instantiateInitialViewController; 方法
     第二种：在 storyboard 的控制器里面设置 Storyboard ID 即可。代码设置如下：
        1. 创建一个 UIStoryboard 对象
        2. 调用 UIStoryboard 对象的 - (__kindof UIViewController *)instantiateViewControllerWithIdentifier:之前设置在 storyboard 上的 Storyboard ID;
     */
    self.window.rootViewController = [board instantiateInitialViewController];
    // 最后别忘了让 self.window 成为主窗口以及可见
    [self.window makeKeyAndVisible];
}
- (void)usingInfoPlistCreateViewController {
    /*
     如果手动添加控制器到项目当中需要做一下工作
     1. 创建一个 UIViewController 的子类
     2. 创建一个 storyboard 其中这里面的控制器的类型设置成自定义的控制器类
     3. 向 Info.plist 当中的 Main storyboard file base name (iPhone) 后面设置 storyboard 的名字即可
     */
}
@end
