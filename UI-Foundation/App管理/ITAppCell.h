//
//  ITAppCell.h
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import <UIKit/UIKit.h>
#import "ITApp.h"
#import "ITAppCellDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITAppCell : UITableViewCell
@property (nonatomic, strong) ITApp *model;
@property (nonatomic, weak) id<ITAppCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
