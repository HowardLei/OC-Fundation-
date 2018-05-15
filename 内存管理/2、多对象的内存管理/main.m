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
// MARK: 1个人进1个房间
void demo1(){
    Gamer *g = [[Gamer alloc] init];
    Room *room1 = [[Room alloc] init];
    g.room = room1;
    [g release];
    NSLog(@"%lu", [room1 retainCount]);
}
// MARK: 人反复进入相同房间
void demo2(){
    Gamer *wangnima = [[Gamer alloc] init];
    Room *r = [[Room alloc] init];
    for (int i = 0; i < 3; i++) {
        wangnima.room = r;
    }
    [wangnima release];
    [r release];
}
// MARK: 一个人从一个房间转换到另外一个房间
void demo3(){
    Gamer *p = [[Gamer alloc] init];
    Room *room1 = [[Room alloc] init];
    Room *room2 = [[Room alloc] init];
    room2.no = 2;
    p.room = room1;
    p.room = room2;
    NSLog(@"我现在的%d号房间里有%lu个人", room1.no, [room1 retainCount] - 1);
    NSLog(@"我现在的%d号房间里有%lu个人", room2.no, room2.retainCount - 1);
    [p release];
    [room1 release];
    [room2 release];
}
void try(){
    Gamer *zhaosi = [[Gamer alloc] init];
    Room *r = [[Room alloc] init];
    zhaosi.room = r;
    [r release]; //其实这个方法相当于这个，人离开了房间，让房间的所有者 -1
    zhaosi.room = r;
    NSLog(@"%lu", r.retainCount);
    [zhaosi release];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo1();
//        demo2();
//        demo3();
        try();
    }
    return 0;
}
