#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "Room.h"
// MARK:用 @property 中的 retain 参数来进行创建 setter 和 getter 方法，结果与之前创建的手写的效果代码一样。
void demo1(){
    Gamer *p = [[Gamer alloc] init];
    Room *room1 = [[Room alloc] init];
    Room *room2 = [[Room alloc] init];
    p.room = room1;room1.no = 1;
    NSLog(@"现在%@在%d号房间有%lu个人",p, p.room.no, [p.room retainCount] - 1);
    p.room = room2;room2.no = 2;
    NSLog(@"现在%@在%d号房间有%lu个人", p, p.room.no, [p.room retainCount] - 1);
    [p release];
    [room1 release];
    [room2 release];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo1();
    }
    return 0;
}
