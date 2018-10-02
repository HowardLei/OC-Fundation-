#import <UIKit/UIKit.h>
#import "ITGoods.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITTableViewCell : UITableViewCell
@property (nonatomic, strong) ITGoods *goods;
+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
