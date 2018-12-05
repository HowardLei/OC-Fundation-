//
//  Person.h
//  构造方法
//
//  Created by jyz on 2018/11/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
