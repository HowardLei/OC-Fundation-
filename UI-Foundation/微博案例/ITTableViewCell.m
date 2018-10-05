#import "ITTableViewCell.h"

@interface ITTableViewCell ()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UIImageView *VIPImageView;
@property (nonatomic, weak) UIImageView *weiboImageView;
@end

@implementation ITTableViewCell

/*
 为了保证重写的单元格满足自定义的格式，所以说在这里面需要自己重新定义 cell 的格式。
 所以说重写 initWithStyle 方法。添加自定义的控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        // 在这里面实现自定义的控件
        // 添加一个姓名 label
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel = nameLabel;
        // 添加一个内容 label
        [self.contentView addSubview:self.contentLabel];
        // 添加一个 VIP 的标签
        [self.contentView addSubview:self.VIPImageView];
        // 添加一个头像
        [self.contentView addSubview:self.iconView];
        // 添加一个配图
        [self.contentView addSubview:self.weiboImageView];
    }
    return self;
}
// MARK:重写 tableViewCell 的 setter 方法
// 注意：在这个 setter 方法中，设置数据和 frame
- (void)setModel:(ITWeibo *)model {
    _model = model;
    [self setData];
    [self setWidgetFrame];
}
/**
 设置属性中的数据
 */
- (void)setData{
    ITWeibo *model = self.model;
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.text;
    if (model.picture == nil) {
        self.imageView.hidden = YES;
    } else {
        self.imageView.hidden = NO;
        self.imageView.image = [UIImage imageNamed:model.picture];
    }
    self.iconView.image = [UIImage imageNamed:model.icon];
    // 判断是否是VIP，如果是，显示VIP图标，如果不是，则不显示。
    if (model.isVip.boolValue) {
        self.VIPImageView.hidden = NO;
        self.VIPImageView.image = [UIImage imageNamed:@"vip"];
    } else {
        self.VIPImageView.hidden = YES;
    }
}
/**
 设置控件的 frame 大小
 */
- (void)setWidgetFrame {
    // 设置通用的间距
    CGFloat margin = 10;
    // 1、设置头像的 frame
    CGFloat iconWidth = 30;
    CGFloat iconHeight = 30;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    self.iconView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    // 2、设置昵称的 frame

    self.nameLabel.frame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
    // 3、设置 VIP 的 frame
    CGFloat VIPWidth = margin;
    CGFloat VIPHeight = margin;
    CGFloat VIPX = CGRectGetMaxX(self.nameLabel.frame) + margin;
    CGFloat VIPY = nameY;
    self.VIPImageView.frame = CGRectMake(VIPX, VIPY, VIPWidth, VIPHeight);
    // 4、设置微博内容的 frame
    // 5、设置微博配图的 frame
}
@end
