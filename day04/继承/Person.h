#import <Foundation/Foundation.h>
#import "Fruit.h"
#import "Apple.h"
@interface Person : NSObject{
    double _is;
}
@property NSString *name;
@property int age;
@property Fruit *fruit;
- (void)eatFruit:(Fruit *)fruit;
@end
