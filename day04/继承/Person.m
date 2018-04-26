#import "Person.h"

@implementation Person
- (void)eatFruit:(Fruit *)fruit{
    NSLog(@"%@正在吃%@", _name, fruit.name);
}
@end
