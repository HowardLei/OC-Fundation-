//
//  ITHeaderFooterView.h
//  好友列表
//
//  Created by jyz on 2018/11/21.
//

#import <UIKit/UIKit.h>
#import "ITGroup.h"
NS_ASSUME_NONNULL_BEGIN
@class ITHeaderFooterView;
@protocol ITHeaderFooterViewDelegate <NSObject>

- (void)reloadTheDataWithHeaderView:(ITHeaderFooterView *)headerView;

@end
@interface ITHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) ITGroup *model;
@property (nonatomic, weak) id<ITHeaderFooterViewDelegate> delegate;
+ (instancetype)headerFooterViewWithTableView:(UITableView * )tableView;
@end

NS_ASSUME_NONNULL_END
