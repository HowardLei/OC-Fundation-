#import <Foundation/Foundation.h>
#import "Room.h"
@interface Gamer : NSObject
/*
 @property (retain)等效代码如下
    //声明代码
    @interface Gamer : NSObject
    {
    Room *_room;
    }
    - (void)setRoom:(Room *)room;
    - (Room *)room;
    @end
    // 实现代码
    @implementation Gamer
    - (void)setRoom:(Room *)room{
        if (_room != room) {
            [_room release];
            _room = [room retain];
        }
    }
    - (Room *)room{
        return _room;
    }
    @end
 */

@property(nonatomic, retain) Room *room;
@end
