#import "Boy.h"

@implementation Boy
- (void)talkLoveWith:(Girl *)girl {
    NSLog(@"这是谁啊");
    if (girl.boy == self) {
        self.girl = girl;
        NSLog(@"么么");
        [girl wash];
        [girl cook];
        NSLog(@"大胖老婆快来我怀里恩爱一下嘛");
    } else {
        NSLog(@"对不起走错了");
    }
}
@end
