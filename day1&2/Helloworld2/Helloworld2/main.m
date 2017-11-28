
//  main.m


#import <Foundation/Foundation.h>
#import "show.h" //调用同目录下文件调头文件！！！
void  test(){
    printf("This is a subfunction. \n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();//OC调用C中的函数是可行的
        testshow();//调用本地C语言文件也可以
    }
    return 0;
}
