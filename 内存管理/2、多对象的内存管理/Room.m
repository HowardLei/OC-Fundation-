#import "Room.h"

@implementation Room
- (instancetype)init{
    self = [super init];
    if (self) {
        _no = 1;
    }
    return self;
}
- (void)dealloc{
    NSLog(@"%d号房间没人用，删除房间", self.no);
    [super dealloc];
}
@end
