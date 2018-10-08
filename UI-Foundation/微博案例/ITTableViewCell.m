#import "ITTableViewCell.h"

@interface ITTableViewCell ()
// FIXME:为什么这个地方用 weak 就不行？
@property (weak, nonatomic) UILabel *nameLabel;
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
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}

/**
 初始化界面
 */
- (void)setUpUI {
    // 在这里面实现自定义的控件
    // 添加一个姓名 label
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:self.nameLabel];
    // 添加一个内容 label
    UILabel *contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel = contentLabel;
    [self.contentView addSubview:self.contentLabel];
    // FIXME: 修复下边控件添加的顺序
    // 添加一个 VIP 的标签
    UIImageView *VIPImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.VIPImageView];
    self.VIPImageView = VIPImageView;
    // 添加一个头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconView];
    self.iconView = iconView;
    // 添加一个配图
    UIImageView *weiboImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.weiboImageView];
    self.weiboImageView = weiboImageView;
}
// MARK:重写 tableViewCell 的 setter 方法
// 注意：在这个 setter 方法中，设置数据和 frame
- (void)setModel:(ITWeibo *)model {
    _model = model;
    [self setDataForModel:model];
    [self setWidgetFrameForModel:model];
}
/**
 设置属性中的数据
 */
- (void)setDataForModel:(ITWeibo *)model {
    self.nameLabel.hidden = NO;
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
- (void)setWidgetFrameForModel:(ITWeibo *)model {
    // 设置通用的间距
    CGFloat margin = 10;
    // 1、设置头像的 frame
    CGFloat iconWidth = 30;
    CGFloat iconHeight = 30;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    self.iconView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    // 2、设置昵称的 frame
    CGSize nameSize = [model.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
    CGFloat nameWidth = nameSize.width;
    CGFloat nameHeight = nameSize.height;
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + margin;
    CGFloat nameY = (CGRectGetMaxY(self.iconView.frame) - margin - nameHeight) / 2 + margin;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
    // 3、设置 VIP 的 frame
    CGFloat VIPWidth = margin;
    CGFloat VIPHeight = margin;
    CGFloat VIPX = CGRectGetMaxX(self.nameLabel.frame) + margin;
    CGFloat VIPY = nameY;
    self.VIPImageView.frame = CGRectMake(VIPX, VIPY, VIPWidth, VIPHeight);
    // 4、设置微博内容的 frame
    CGSize weiboSize = [model.text boundingRectWithSize:CGSizeMake(self.contentLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size;
    CGFloat weiboWidth = weiboSize.width;
    CGFloat weiboHeight = weiboSize.height;
    CGFloat weiboX = margin;
    CGFloat weiboY = CGRectGetMaxY(self.iconView.frame) + margin;
    self.contentLabel.frame = CGRectMake(weiboX, weiboY, weiboWidth, weiboHeight);
    // 5、设置微博配图的 frame
    CGFloat weiboPictureWidth = 2 * iconWidth;
    CGFloat weiboPictureHeight = weiboWidth;
    CGFloat weiboPictureX = weiboX;
    CGFloat weiboPictureY = CGRectGetMaxY(self.contentLabel.frame) + margin;
    self.weiboImageView.frame = CGRectMake(weiboPictureX, weiboPictureY, weiboPictureWidth, weiboPictureHeight);
}
@end
