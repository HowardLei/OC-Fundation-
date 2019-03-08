//
//  ITContactController.h
//  私人通讯录
//
//  Created by 雷维卡 on 2019/3/7.
//

#import <UIKit/UIKit.h>
@class ITContact;
NS_ASSUME_NONNULL_BEGIN

@interface ITContactController : UITableViewController
@property (nonatomic, strong) ITContact *contact;
@end

NS_ASSUME_NONNULL_END
