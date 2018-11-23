#import <UIKit/UIKit.h>
#import "ITWeibo.h"

@interface ITTableViewCell : UITableViewCell
@property (nonatomic, strong) ITWeibo *model;
@property (nonatomic, weak) UIImageView *weiboImageView;
@property (nonatomic, assign) CGFloat heightForRow;
@end
