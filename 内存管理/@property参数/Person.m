#import "Person.h"

@implementation Person
// MARK: 如果想实现浅拷贝，那就直接 return self;
// MARK: 如果想实现深拷贝，则实现以下代码
- (id)copyWithZone:(nullable NSZone *)zone {
    Person *p = [[Person alloc] init];
    p.age = _age;
    p.name = _name;
    return p;
}
@end
