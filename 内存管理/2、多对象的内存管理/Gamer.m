#import "Gamer.h"

@implementation Gamer
- (void)setRoom:(Room *)room{
    // 当人进入了这个房间，相当于这个房间多了一个所有者，所以房间的引用计数的时候需要 +1
    // 但是直接写[room retain]会导致计数器不断添加。如果相同对象不断进入，则会造成冗余。
    // 所以需要判断原来的人是不是进入了相同的房间
    if (_room != room) {
        [_room release];
        _room = [room retain];
    }
}
- (Room *)room{
    return _room;
}
- (void)dealloc{
    [self.room release];
    NSLog(@"我不玩了，先走了");
    [super dealloc];
}
@end
