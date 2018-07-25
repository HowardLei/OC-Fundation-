#import <Foundation/Foundation.h>
/*
 NSFileManager 类（负责操作磁盘中的文件和文件夹）
 1、创建这个类的对象（创建方式：单例模式）
    NSFileManager *manager = [NSFileManager defaultManager];
 2、常用的判断方法：
    1）判断文件/夹是否在此路径下存在。方法：- (BOOL)fileExistsAtPath:路径 isDirectory:BOOL型指针;
        注意：第二个参数是判断这是个文件还是文件夹
    2）判断文件/夹是否可以读取。方法：- (BOOL)isReadableFileAtPath:路径;
    3）判断文件/夹是否可写。方法：- (BOOL)isWritableFileAtPath:路径;
    4）判断文件/夹是否可以删除。方法：- (BOOL)isDeletableFileAtPath:路径;
 3、常用的获取信息的方法：
    1）获取指定文件/夹的属性信息。方法：- (nullable NSDictionary *)attributesOfItemAtPath:文件路径 error:NSError *型指针。
    2）获取指定目录下的所有文件及目录。方法：- (nullable NSArray *)subpathsAtPath:路径;
    3）获取指定目录下的子目录和文件。不能查找孙子辈。方法：- (nullable NSArray *)contentsOfDirectoryAtPath:路径 error:NSError *型指针
 4、创建文件/夹
    1）指定目录下创建文件。方法：- (BOOL)createFileAtPath:路径 contents:NSData 型数据 attributes:默认为 nil;
                        注意：NSData 对象是专门保存二进制数据。属性本身是字典对象，如果是想按照系统默认的设置，则写 nil 。
    2）指定目录下创建文件夹。方法：- (BOOL)createDirectoryAtPath:路径 withIntermediateDirectories:BOOL类型  attributes:默认为 nil attributes error:NSError *型指针
                        注意：第二个参数是询问创建文件夹是不是一路创建。一路创建指的是按照目录
 */
// MARK: 判断
void judge() {
    NSFileManager *manager = [NSFileManager defaultManager];
    // 判断一个文件的完整权限
    BOOL a;
    BOOL res = [manager fileExistsAtPath:@"/Users/apple/Desktop/dict.plist" isDirectory:&a];
    NSMutableString *t = [NSMutableString string];
    if (a == YES) {
        [t appendString:@"文件夹"];
    } else {
        [t appendString:@"文件"];
    }
    if (res == YES) {
        if ([manager isReadableFileAtPath:@"/Users/apple/Desktop/dict.plist"] == YES) {
            if ([manager isWritableFileAtPath:@"/Users/apple/Desktop/dict.plist"] == YES) {
                if ([manager isDeletableFileAtPath:@"/Users/apple/Desktop/dict.plist"] == YES) {
                    NSLog(@"此%@有所有权限", t);
                } else {
                    NSLog(@"此%@没有删除所有权限", t);
                }
            } else {
                NSLog(@"此%@没有写的权限", t);
            }
        } else {
            NSLog(@"此%@没有读的权限", t);
        }
    } else {
        NSLog(@"此%@不存在", t);
    }
}
// MARK: 获取信息
void getInfo() {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *err = nil;
    NSDictionary *dict = [manager attributesOfItemAtPath:@"/Users/apple/Desktop/dict.plist" error:&err];
    if (!err) {
        for (NSString *key in dict) {
            NSLog(@"%@: %@", key, dict[key]);
        }
    } else {
        NSLog(@"读取错误");
    }
    NSArray *arr = [manager subpathsAtPath:@"/Users/apple/desktop/JAVA"];
    NSLog(@"%@", arr);
    NSArray * arr1 = [manager contentsOfDirectoryAtPath:@"/Users/apple/desktop" error:&err];
    NSLog(@"%@", arr1);
}
// MARK: 创建文件/夹
void create() {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *err = nil;
    NSString *str = @"王尼玛";
    BOOL a = [manager createFileAtPath:@"/Users/Apple/Desktop/a.txt" contents:[str dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    if (a) {
        NSLog(@"创建成功");
    } else {
        NSLog(@"创建失败");
    }
    BOOL b = [manager createDirectoryAtPath:@"/Users/Apple/Desktop/AA/DD" withIntermediateDirectories:YES attributes:nil error:&err];
    if (b) {
        NSLog(@"文件夹创建成功");
    } else {
        NSLog(@"文件夹创建失败");
    }
    BOOL c = [manager removeItemAtPath:@"/Users/Apple/Desktop/AA" error:&err];
    if (c) {
        NSLog(@"文件/夹成功删除");
    } else {
        NSLog(@"文件/夹删除失败");
    }
}
// MARK: 一个小 demo
void demo() {
    // 文件终结者 删除一个文件夹中的所有文件。
    while (1) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSError *err;
        NSString *path = @"/Users/apple/Desktop/万能破坏文件夹/";
        NSArray *arr = [manager subpathsOfDirectoryAtPath:path error:&err];
        if (arr.count > 0) {
            for (NSString *p in arr) {
                NSString *newPath = [NSString stringWithFormat:@"%@%@",path,p];
                if ([manager isDeletableFileAtPath:newPath]) {
                    [manager removeItemAtPath:newPath error:&err];
                }
            }
        }
        NSLog(@"扫描成功");
        // 暂停 3s 再执行
        [NSThread sleepForTimeInterval:3];
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        judge();
//        getInfo();
//        create();
        demo();
    }
    return 0;
}
