#import "Discount.h"
#import "SubDiscount.h"
#import "MxJx.h"
#import "Store.h"

@implementation Store
//欢迎语
- (void)helloWorld{
    NSLog(@"欢迎来到Apple Store.");
    NSLog(@"我们有以下商品供您选择：iPhone、iPad、Mac");
    NSLog(@"请输入您的选择");
    
    char name[100];
    scanf("%s",name);//在输入的时候，OC没有提供相应函数，所以在调用的时候还需要借用C中的scanf函数，到时候再将输入的数据转换为OC数据类型
    NSLog(@"请输入您所需要的数量:");
    int count;
    scanf("%d",&count);//&这是取地址，取count的地址
    //取商品
    NSString * name1 = [NSString stringWithUTF8String:name];//把C语言的字符串转换为OC字符串
    //
    NSMutableArray * temp = [_shelf getGoodsWithName:name1 andCount:count];
    float money = [self getMoneyWithTemp:temp];
    NSLog(@"你所购买的商品总价为%.2f",money);
    //计算打折
    NSLog(@"我们有如下打折信息可供选择:1.不打折、2.打8折、3.每满300减50");
    int num;
    scanf("%d",&num);
    float realMoney = [self getRealMoney:money andNum:num];
    NSLog(@"打折后的总价是%.2f",realMoney);
    //确认购买
    NSLog(@"请确认购买吗？1、确认；2、取消；3、退出");
    int num1;
    scanf("%d",&num1);
    if (num1 == 1) {
        NSLog(@"您选择的商品名是:%@,商品的数量是%d,商品的总价是%.2f,商品的折扣价是%.2f",name1,count,money,realMoney);
    }else if (num1 == 2){
        [self helloWorld];
        [_shelf addGoodsWithName:name1 andCount:count];//把删除掉的商品重新加回去
    }else{
        NSLog(@"ค(TㅅT)再见");
        [_shelf addGoodsWithName:name1 andCount:count];//把删除掉的商品重新加回去
    }
    //库存展示
    [_shelf show];
}
//打折方法
- (float)getRealMoney:(float)money andNum:(int)num{
    if (num == 1) {
        Discount * dis = [[Discount alloc]init];
        [dis getDiscountMoney:money];
        return [dis getDiscountMoney:money];
    }
    else if (num == 2){
        SubDiscount * sub =[[SubDiscount alloc]init];
        sub.rate = 0.8;
        [sub getSubDiscountMoney:money];
        return [sub getSubDiscountMoney:money];
    }
    else if (num == 3){
        MxJx * dz = [[MxJx alloc]init];
        dz.m = 300;
        dz.j = 50;
        [dz getMxJxMoney:money];
        return [dz getMxJxMoney:money];
    }else{
        return 0;
    }
}
//计算正常价格
- (float)getMoneyWithTemp:(NSMutableArray *)temp{
    int money = 0;
    for (int i = 0; i < temp.count; i++) {
        Goods * good = temp [i];
        money += good.price;
    }
    return money;
}
//重写构造方法，对货架进行初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shelf = [[Shelf alloc]init];
        //往货架上添加商品
        [_shelf addGoodsWithName:@"iPhone" andCount:100];
        [_shelf addGoodsWithName:@"iPad" andCount:100];
        [_shelf addGoodsWithName:@"Mac" andCount:100];
    }
    return self;
}
@end
