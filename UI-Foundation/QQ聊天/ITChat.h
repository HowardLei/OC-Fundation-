//
//  ITChat.h
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface ITChat : NSObject
typedef enum{
    ITChatPersonMe,
    ITChatPersonOther
} ITChatPerson;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) ITChatPerson type;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)chatWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
