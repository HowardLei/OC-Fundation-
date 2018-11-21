#import <Foundation/Foundation.h>

@interface Fruit : NSObject
@property NSString *name;
@property int weight;
- (double)sellWithPrice:(int)price;
-(NSString *)description;
@end
