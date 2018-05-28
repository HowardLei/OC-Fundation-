#import "Person.h"
// MARK: 分类的声明 @interface 类名 （分类名）
@interface Person (eat)
// 注意：在分类中，不能声明成员变量。只能扩展方法。
- (void)eatFish;
@end
