#import <Foundation/Foundation.h>

void test1(){
    BOOL flag = YES;
    if (flag) {
        NSLog(@"我就是比你牛逼");
    }else{
        NSLog(@"不如我了吧");
    }
}
void test2(){
    Boolean flag = true;
    if (flag) {
        NSLog(@"哈哈哈哈");
    }else{
        NSLog(@"还笑得出来吗？");
    }
}

@interface Mankind :NSObject //声明类的关键字是@interface，在@interface后边写‘类名：父类名称’ 一般父类名称为NSObject 变量名，函数名之类等等用英文字母命名时，不要用汉语拼音，不会翻译成英文的用有道词典翻译
{   //‘{}’用来声明类的属性（变量）
    @public //作用是让对象可以访问自己的对象属性
    NSString * _name; //声明人的名字，数据类型为NSString，注意在写的过程中需要在属性前面加‘_’
    int _age;  //声明年龄
    float _weight; //声明体重
}
    //下边是用来声明类的方法
- (void)eat; //声明吃方法 对象方法
- (void)run; //声明跑方法
+ (void)jump;//声明跳方法 类方法
@end
//上边的声明类一般写在.h的头文件中

@implementation Mankind //实现类的方法关键词是@implementation，后边写实现的类名。记住，后边没有'{}'
    - (void)eat{
        NSLog(@"吃吃吃"); //实现吃
    }
    - (void)run{
        NSLog(@"跑跑跑"); //实现跑
    }
    + (void)jump{
        NSLog(@"跳跳跳"); //实现跳
    }
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        test2();
        //如果创建一个对象的话，写法： 类名 * 对象名 = [类名 new]
        Mankind * zhangsan = [Mankind new];
        
        //对象的属性进行初始化 格式：对象->_属性 = 对应格式;
        zhangsan->_name = @"张三";
        zhangsan->_age = 18;
        zhangsan->_weight = 120.3;
        
        NSLog(@"name --> %@,age --> %d,weight --> %.2f",zhangsan->_name,zhangsan->_age,zhangsan->_weight);//访问对象成员的属性，一般写法：对象名 -> 对象属性；或者 (*对象名).对象属性
        NSLog(@"zhangsan --> %p",zhangsan); //这是打印出张三这个对象的指针地址
        
        Mankind * lisi = [Mankind new];
        
        lisi->_name = @"李四";
        lisi->_age = 15;
        lisi->_weight = 140.0;
        
        NSLog(@"name --> %@,age --> %d, weight --> %.1f",lisi->_name,lisi->_age,lisi->_weight);
        /*@try {
            //这片区域写可能出错的代码
            NSLog(@"我技术最牛逼");
        } @catch (NSException *exception) {
            //假如try区域有错误的话运行这片代码
            NSLog(@"谁能杀我？");
        } @finally {
            //无论try对不对，finally都运行
            NSLog(@"我是finally，有谁比我强？");
        } */
    }
    return 0;
}
