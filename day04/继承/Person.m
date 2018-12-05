#import "Person.h"

@implementation Person
- (void)eatFruit:(Fruit *)fruit{
    NSLog(@"父类正在吃%@", fruit.name);
}

- (void)show {
    NSLog(@"%@", self.name);
}
@end
