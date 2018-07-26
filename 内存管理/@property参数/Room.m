#import "Room.h"

@implementation Room
- (void)dealloc{
    NSLog(@"销毁%d号房间", self.no);
    [super dealloc];
}
@end
