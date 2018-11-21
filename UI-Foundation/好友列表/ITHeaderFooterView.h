//
//  ITHeaderFooterView.h
//  好友列表
//
//  Created by jyz on 2018/11/21.
//

#import <UIKit/UIKit.h>
#import "ITGroup.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) ITGroup *model;
+ (instancetype)headerFooterViewWithTableView:(UITableView * )tableView;
@end

NS_ASSUME_NONNULL_END
