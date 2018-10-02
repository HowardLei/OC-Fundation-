#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ITFooterViewDelegate;

@interface ITFooterView : UIView
@property (nonatomic, weak) id<ITFooterViewDelegate> delegate;
@end

@protocol ITFooterViewDelegate <NSObject>
- (void)addElementInTableView:(ITFooterView *)tableView;
@end

NS_ASSUME_NONNULL_END
