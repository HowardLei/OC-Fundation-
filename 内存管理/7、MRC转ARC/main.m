#import <Foundation/Foundation.h>
#import "Person.h"
/*
 在 ARC 中，由于不需要自己管理 retain release autorelease，所以在之前的 MRC 的代码中，如果想转换成 ARC ，有 2 种方案
    1、手动清除 retain release
    2、用 Xcode 自带的方法进行操作，在 MRC 的文件中，选择 Edit-Convert-To Objective-C ARC ，然后选择需要转换的文件，进行转换
 如果有些文件不能转换为 ARC 时，需要将其加上 -fno-objc-arc 编译标记。在项目里的 Bulid Phrase 找 compiler Sources 中在需要不转换 ARC 的文件里添加编辑，标记 ARC 的文件时添加 -fobjc-arc（这个标记只能在 ARC 环境下添加）
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.name = @"王尼玛";
        p.age = 18;
    }
    return 0;
}
