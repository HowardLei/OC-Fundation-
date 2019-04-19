//
//  ITTableViewCell.h
//  QQ聊天
//
//  Created by jyz on 2018/10/16.
//

#import <UIKit/UIKit.h>
#import "ITChat.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITTableViewCell : UITableViewCell
@property (nonatomic, strong) ITChat *model;
- (void)setModel:(ITChat *)model lastRowName:(nullable NSString *)name;
@end

NS_ASSUME_NONNULL_END
