//
//  ITTableViewCell.h
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import <UIKit/UIKit.h>
#import "ITFriends.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITTableViewCell : UITableViewCell
@property (nonatomic, strong) ITFriends *model;
+ (instancetype)cellWithTableView:(UITableView *)cell;
@end

NS_ASSUME_NONNULL_END
