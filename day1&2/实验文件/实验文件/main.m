#import <Foundation/Foundation.h>
#import "Gun.h"//记住引入的时候引入.h文件
#import "Human.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human * zhangsan = [Human new];
        zhangsan->_name = @"张三丰";
        zhangsan->_level= 100;
        zhangsan->_blood= 100;
        Gun * ak = [Gun new];
        ak->_gunType = @"AK47";
        ak->_bulletCount = 30;
        for (int i = 0; i < 40; i++) {
            [zhangsan fireByGun:ak];
        }
    }
    return 0;
}
