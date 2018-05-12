#import "Gamer.h"

@implementation Gamer
- (void)setRoom:(Room *)room{
    // 当人进入了这个房间，相当于这个房间多了一个所有者，所以房间的引用计数的时候需要 +1
    [room retain];
    _room = room;
}
- (Room *)room{
    return _room;
}
- (void)leaveRoom:(Room *)room{
    // 当人离开了这个房间，相当于这个房间少了一个所有者，所以房间的引用计数的时候需要 -1
    [room release];
}
@end
