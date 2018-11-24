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
/*
 ITHeaderView 这个地方的代理是让控制器控制里面的单元格折叠与展开:
    一、headerView 需要 controller 来刷新 tableView
    二、controller 需要根据数据的变化来决定到底应该是折叠还是展开：
        判断条件：
            1、群组的状态是不是可见的(ITGroup 中的 isVisible 属性)
            2、需要控制哪一个组的展开/折叠(tableView Data Source 方法中的 section 值)
 */
@protocol ITHeaderFooterViewDelegate <NSObject>
- (void)reloadTheDataWithHeaderView:(ITHeaderFooterView *)headerView;
@end

@interface ITHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) ITGroup *model;
@property (nonatomic, weak) id<ITHeaderFooterViewDelegate> delegate;
+ (instancetype)headerFooterViewWithTableView:(UITableView * )tableView;
@end

NS_ASSUME_NONNULL_END
