#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "Room.h"
/*
 1、模拟1个玩家进入1个房间的过程.
 分析:
    类:玩家、房间类
    需求：让玩家拥有一间房
 2、让玩家换房间，进入1号房间后，再进入2号房间
 */
// MARK: 人反复进入相同房间
void demo1(){
    Gamer *wangnima = [[Gamer alloc] init];
    Room *r = [[Room alloc] init];
    for (int i = 0; i < 3; i++) {
        wangnima.room = r;
    }
    [wangnima release];
    [r release];
    NSLog(@"%lu", [r retainCount]);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Gamer *g = [[Gamer alloc] init];
//        Room *room1 = [[Room alloc] init];
//        g.room = room1;
//        [g release];
//        NSLog(@"%lu", [room1 retainCount]);
        demo1();
    }
    return 0;
}
