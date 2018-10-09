#import <UIKit/UIKit.h>
#import "ITWeibo.h"

@interface ITTableViewCell : UITableViewCell
@property (nonatomic, strong) ITWeibo *model;
@property (weak, nonatomic) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UIImageView *VIPImageView;
@property (nonatomic, weak) UIImageView *weiboImageView;
@end
