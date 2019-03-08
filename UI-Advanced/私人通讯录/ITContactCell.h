//
//  ITContactCell.h
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import <UIKit/UIKit.h>
@class ITContact;
NS_ASSUME_NONNULL_BEGIN

@interface ITContactCell : UITableViewCell
@property (nonatomic, strong) ITContact *model;
@end

NS_ASSUME_NONNULL_END
