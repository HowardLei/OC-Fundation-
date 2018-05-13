#import <Foundation/Foundation.h>
#import "Room.h"
@interface Gamer : NSObject
{
    Room *_room;
}
// 这个 setter 方法相当于人进入了这个房间
- (void)setRoom:(Room *)room;
- (Room *)room;
@end
