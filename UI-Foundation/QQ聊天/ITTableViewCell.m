//
//  ITTableViewCell.m
//  QQ聊天
//
//  Created by jyz on 2018/10/16.
//

#import "ITTableViewCell.h"
#define messageFont [UIFont systemFontOfSize:14]
#define timeFont [UIFont systemFontOfSize:12]
@interface ITTableViewCell ()
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIButton *messageButton;
@end

@implementation ITTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
// 重写 initWithStyle 方法，自定义 cell 中的控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 在这个地方创建子控件
        // 1、创建一个时间控件
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:timeLabel];
        // 2、创建一个头像
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:iconImageView];
        // 3、创建一个消息框
        UIButton *messageButton = [[UIButton alloc] init];
        [messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        messageButton.userInteractionEnabled = YES;
        self.messageButton = messageButton;
        [self.contentView addSubview:messageButton];
    }
    return self;
}
// 重写 setModel 方法。
- (void)setModel:(ITChat *)model {
    _model = model;
    [self setDataFromModel:model];
    [self setModelFrameFromModel:model];
}
// 设置控件的数据
- (void)setDataFromModel:(ITChat *)model {
    // 设置聊天的时间文本
    self.timeLabel.text = model.time;
    // 设置头像
    // 注意：由于不知道是我发的还是其他人发的，需要先根据枚举进行判断，再进行设置
    NSString *messager = model.type ? @"other" : @"me";
    self.iconImageView.image = [UIImage imageNamed:messager];
    // 设置消息按钮的文本
    [self.messageButton setTitle:model.text forState:UIControlStateNormal];
    self.messageButton.titleLabel.font = messageFont;
    self.messageButton.titleLabel.numberOfLines = 0;
    NSString *bubbleImage = model.type ? @"chat_recive_nor" : @"chat_send_nor";
    UIImage *image = [self resizeImageWithImage:bubbleImage];
    [self.messageButton setBackgroundImage:image forState:UIControlStateNormal];
    self.messageButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
}
// 设置控件的 frame
- (void)setModelFrameFromModel:(ITChat *)model {
    CGFloat margin = 5;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    // 设置时间的 frame
    CGFloat timeWidth = screenWidth;
    CGFloat timeHeight = 10;
    CGFloat timeX = 0;
    CGFloat timeY = margin;
    self.timeLabel.frame = CGRectMake(timeX, timeY, timeWidth, timeHeight);
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = timeFont;
    // 设置头像的 frame
    // 注意：根据加载的头像不同，他们的头像 frame 也不完全相同
    CGFloat iconWidth = 30;
    CGFloat iconHeight = iconWidth;
    CGFloat iconX = model.type == ITChatPersonOther ? margin : screenWidth - iconWidth - margin;
    CGFloat iconY = CGRectGetMaxY(self.timeLabel.frame) + margin;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    // 设置对话框的 frame
    // 注意：根据加载的头像不同，他们的对话框的 frame 也不完全相同
    CGSize messageSize = [self.messageButton.currentTitle boundingRectWithSize:CGSizeMake(screenWidth - 4 * iconWidth - 4 * margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: messageFont} context:nil].size;
    CGFloat messageWidth = messageSize.width;
    CGFloat messageHeight = messageSize.height;
    CGFloat messageX = model.type == ITChatPersonOther ? CGRectGetMaxX(self.iconImageView.frame) : CGRectGetMinX(self.iconImageView.frame) - messageWidth;
    CGFloat messageY = iconY;
    self.messageButton.frame = CGRectMake(messageX, messageY, messageWidth, messageHeight);
    CGFloat rowHeight = CGRectGetMaxY(self.iconImageView.frame) > CGRectGetMaxY(self.messageButton.frame) ? CGRectGetMaxY(self.iconImageView.frame) + margin : CGRectGetMaxY(self.messageButton.frame) + margin;
    model.height = rowHeight;
}
- (UIImage *)resizeImageWithImage:(NSString *)imageName {
    UIImage *rowImage = [UIImage imageNamed:imageName];
    CGFloat halfImageHeight = rowImage.size.height / 2;
    CGFloat halfImageWidth = rowImage.size.width / 2;
    UIImage *newImage = [rowImage resizableImageWithCapInsets:UIEdgeInsetsMake(halfImageHeight, halfImageWidth, halfImageHeight, halfImageWidth) resizingMode:UIImageResizingModeStretch];
    return newImage;
}
@end
