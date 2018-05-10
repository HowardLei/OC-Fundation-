#import <Foundation/Foundation.h>

//定义一个结构体
/*
 struct <#struct name#>  即结构体类型名
 {
 <#struct fields#>  即成员列表
};   不要忘了大括号后边分号
 */
//举个例子，用结构体创建一个长方形
struct rect {
    int x;
    int y;
    int width;
    int height;
};
typedef struct car {
    double speed;
    char *name;
} Car;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //利用结构体类型定义变量有2种形式
        //1.先定义结构体类型,再定义结构体变量。
        struct point1 {
            int x;
            int y;
        };
        //定义两个结构体变量(最笨的方法)
        struct point1 p1;
        struct point1 p2;
        Car car1;
        car1.name = "王尼玛";
        car1.speed = 120;
        NSLog(@"%s,%g", car1.name, car1.speed);
        //简单方法
        //方法1：使用#define预编译指令定义一个简短的字符串
    }
    return 0;
}
