//
//  ITContact.h
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITContact : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *phoneNumber;
+ (instancetype)contactWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber;
@end

NS_ASSUME_NONNULL_END
