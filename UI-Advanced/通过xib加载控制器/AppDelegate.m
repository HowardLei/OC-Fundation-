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
    /*
     用 xib 创建控制器
     1. 先创建一个自定义控制器，并且选择同时创建 xib 。
     2. 向里面拖动一个 view （注意：是 view，不是 ViewController）
     3. 选择 File's Owner，右键拖线到创建的 view ，与他进行绑定。
     4. 将里面的数据绑定到代理方法当中实现。
     */
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ITViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
