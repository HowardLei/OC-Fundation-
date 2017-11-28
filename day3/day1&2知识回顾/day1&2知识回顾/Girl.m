
#import "Girl.h"

@implementation Girl
-(void)makeACallWithPhone:(Phone *)phone{
    NSLog(@"我给我男朋友打个电话");
    [phone call];//这是调用对象，所以是用小写的phone
}
@end
