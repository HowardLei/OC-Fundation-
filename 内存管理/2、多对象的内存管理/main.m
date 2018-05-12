#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "Room.h"
/*
 1、模拟1个玩家进入1个房间的过程.
 分析:
    类:玩家、房间类
    需求：让玩家拥有一间房
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 先创建玩家与房间
        Gamer *wangnima = [[Gamer alloc] init];
        Room *room = [[Room alloc] init];
        // 让王尼玛进入房间
        wangnima.room = room;
        NSLog(@"房间的引用计数为：%lu", [room retainCount]);
        // 王尼玛退出房间
        [wangnima leaveRoom:room];
        NSLog(@"房间的引用计数为：%lu", [room retainCount]);
    }
    return 0;
}
