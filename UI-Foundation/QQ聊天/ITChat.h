//
//  ITChat.h
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
NS_ASSUME_NONNULL_BEGIN

@interface ITChat : NSObject
typedef enum {
    ITChatPersonMe,
    ITChatPersonOther
} ITChatPerson;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) ITChatPerson type;
@property (nonatomic, assign) CGFloat height;
// 创建一个属性，用来判断时间框是否需要被隐藏
@property (nonatomic, assign) BOOL timeHidden;

- (instancetype)initWithType:(ITChatPerson)type;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)chatWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
