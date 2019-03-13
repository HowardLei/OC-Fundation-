//
//  ITEditController.h
//  私人通讯录
//
//  Created by apple on 2019/3/13.
//

#import <UIKit/UIKit.h>
#import "ITContact.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ITEditControllerDelegate;
@interface ITEditController : UIViewController
@property (nonatomic, strong) ITContact *contact;
@property (nonatomic, weak) id<ITEditControllerDelegate> delegate;
@end

@protocol ITEditControllerDelegate <NSObject>
/**
 将单元格数据传回上一个控制器
 @param contact 联系人数据
 */
- (void)editCellContent:(ITContact *)contact;
@end
NS_ASSUME_NONNULL_END
