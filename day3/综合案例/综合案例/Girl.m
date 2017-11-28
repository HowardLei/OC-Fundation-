
#import "Girl.h"

@implementation Girl
-(void)feedTheCat:(Cat *)cat{
    NSLog(@"%@喂养这只%@",_name,cat->_catName);
}
-(void)playWithTheCat:(Cat *)cat{
    NSLog(@"%@正在陪着%@玩",_name,cat->_catName);
}
@end
