//
//  ITApp.h
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITApp : NSObject

@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSString *download;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign, getter=isDownloaded) BOOL downloaded;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
