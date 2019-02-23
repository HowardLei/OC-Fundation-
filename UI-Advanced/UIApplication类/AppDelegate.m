//
//  AppDelegate.m
//  UIApplication类
//
//  Created by 雷维卡 on 2019/2/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**
 当应用完成启动以后，执行该代理方法
 @param application 当前启动的单例应用
 @param launchOptions 运行选项（里面的内容用字典保存，当用户直接启动应用的时候，字典当中的值可以为空）
 @return 当你的应用无法处理 URL 资源或者是不能继续处理用户活动的时候返回值为 NO，其他情况下都为 YES
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 当应用运行完成以后，重写该方法以调用一些其他需要在启动就要做的方法
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/**
 当应用即将完成启动的时候，执行这个方法
 @param application 当前启动的单例应用
 @param launchOptions 运行选项（里面的内容用字典保存，当用户直接启动应用的时候，字典当中的值可以为空）
 @return 当你的应用无法处理 URL 资源或者是不能继续处理用户活动的时候返回值为 NO，其他情况下都为 YES
 */
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/**
 当应用即将失去焦点（不可交互）的时候，触发下面的方法
 @param application 即将失去焦点的单例应用
 */
- (void)applicationWillResignActive:(UIApplication *)application {
    // 当应用即将从活跃变化到非活跃状态的时候处理这个方法。这个方法的触发可以由于确定类型的打断或者是临时类型的打扰（比如：接听到电话，收到短信）或者是当用户退出这个应用，让这个应用进入后台状态。
    // 使用这个方法以暂停正在执行的任务，停用计时器或是一些无效的图像回调。在游戏中使用这个方法以暂停游戏
    NSLog(@"%s", __FUNCTION__);
}
/**
 当应用进入后台以后需要执行的代码
 @param application 进入后台的应用
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // 调用这个方法用来释放共享资源、保存用户数据、停用计时器和存储应用的状态信息以便当应用转换到前台的时候可以恢复成原样以及防止在以后当应用被销毁的时候没有及时保存信息。
    // 如果你的应用支持后台处理，当用户退出应用的时候。这个方法是用来替代 - (void)applicationWillTerminate:(UIApplication *)application 方法（例如 QQ 消息的接收）
    NSLog(@"%s", __FUNCTION__);
}
/**
 当应用即将进入前台，执行下面方法
 @param application 即将进入前台的应用
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"%s", __FUNCTION__);
}
/**
 应用状态变为活跃以后执行下面方法
 @param application 变为活跃的应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // 当应用从非活跃转换成活跃的时候，可以重新开始启动那些之前备战暂停或者是到现在还没有启动好的任务。如果之前这个应用是在后台转化成活跃的时候，可以顺便刷新一下 UI
    NSLog(@"%s", __FUNCTION__);
}
/**
 当应用即将被销毁的时候，调用以下方法（注意：这个方法的触发需要应用从前台转到后台直接关闭，否则这个方法不会触发）
 @param application 即将被销毁的应用
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    // 当应用即将被销毁的时候触发这个方法。如果合适，可以在这个方法当中保存数据。关于这个方法的其他信息，可以参照 - (void)applicationDidEnterBackground:(UIApplication *)application 方法
    NSLog(@"%s", __FUNCTION__);
}
/**
 当应用收到内存不足的警告的时候，执行下面的方法。如果忽略此警告，则应用会随时被系统清理，表现为闪退。
 @param application 收到内存不足的单例应用
 */
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    // 当应用收到内存警告通知的时候，触发这个方法
    NSLog(@"%s", __FUNCTION__);
}

@end
