#import <Foundation/Foundation.h>
#import "Fruit.h"
#import "Apple.h"
@interface Person : NSObject
@property NSString *name;
@property int age;
@property Fruit *fruit;
- (void)eatFruit:(Fruit *)fruit;
@end
